import { LightningElement, api, track, wire } from "lwc";
import fetchAllRecordsOfSelectedObject from "@salesforce/apex/SObjectController.fetchAllRecordsOfSelectedObject";
import recordsListCol from "@salesforce/apex/SObjectController.recordsListCol";
import { NavigationMixin } from "lightning/navigation";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { deleteRecord } from "lightning/uiRecordApi";
import searchSObjectRecordsOnSearch from '@salesforce/apex/SObjectController.searchSObjectRecordsOnSearch';

export default class LwcSobjectRecordList extends NavigationMixin(LightningElement) {
  @track allRecordsOfSelectedObject = [];
  @api objectNameGrand = "";
  @api arrayToSendGrand = [];
  @track columnsMap = [];
  @track searchData='';
  @track searchByField='';
  @api arrayDuplicateList=[];
  @track allRecordsOfSelectedObject12=[];
  @track boolVal=true;
  @api boolValChild;
  @track boolValForButton=false;
  @track countEditDelete=0;
  @track selectedRows;
  @track actions = [
    { label: "View", name: "view" },
    { label: "Edit", name: "edit" },
    { label: "Delete", name: "delete" }
  ];
  @wire(recordsListCol, {
    strObjectName: "$objectNameGrand",
    recordId: "$arrayToSendGrand"
  })
  tempList({ data, error }) {
    const selectedFields = this.arrayToSendGrand;
    if(selectedFields.length>0){
      this.columnsMap = [
        ...selectedFields.map((fieldName) => ({
          label: fieldName,
          fieldName: fieldName.contains === "Name" ? "TempName" : fieldName,
          type: fieldName === "Name" ? "url" : "text",
          typeAttributes: {
            label: {
              fieldName: "Name",
              target: "_blank"
            }
          }
        })),
        {
          type: "action",
          typeAttributes: {
            target: "_blank",
            rowActions: this.actions
          }
        }
      ];
    }
    else if(selectedFields.length == 0){
      this.columnsMap =[];
    }
  }
  @wire(fetchAllRecordsOfSelectedObject, { strObjectName: "$objectNameGrand",count:'$countEditDelete' })
  wiredObjectRecords({ data, error }) {
   
    if (data) {
      let tempRecs = [];
      let count=0;
      data.forEach((record) => {
        count++;
        let tempRec = Object.assign({}, record);
        tempRec.TempName = "/" + tempRec.Id;
        tempRecs.push(tempRec);
        console.log(tempRec);
      });
      this.allRecordsOfSelectedObject = tempRecs;
      this.error = undefined;
      if(count>0){
        this.boolVal=true;
      }
      else{
        const toastEvent = new ShowToastEvent({
          title: "There No Records!",
          message: this.objectNameGrand+" Does Not Contains Any Records",
          variant: "error"
        });
        this.dispatchEvent(toastEvent);
      }
    } else if (error) {
      this.error = error;
      this.allRecordsOfSelectedObject = undefined;
    }
  }

  handleRowAction(event) {
    const actionName = event.detail.action.name;
    const row = event.detail.row;
    switch (actionName) {

      case "edit":
        this[NavigationMixin.Navigate]({
          type: "standard__recordPage",
          attributes: {
            recordId: row.Id,
            objectApiName: "MyCustomObject__c",
            actionName: "edit"
          }
        }).then(function(navigationSuccess) {
           if (navigationSuccess) {
            this.countEditDelete++;
           // navigation was successful, the record was edited
           console.log("Record was successfully edited.");
           } else {
           // navigation was not successful, the record was not edited
           console.log("Record editing failed.");
           }
          });
        
        break;

      case "delete":
        const recordId = row.Id;
        deleteRecord(recordId)
          .then(() => {
            const index = this.allRecordsOfSelectedObject.findIndex(
              (record) => record.Id === recordId
            );
            this.allRecordsOfSelectedObject.splice(index, 1);
            const toastEvent = new ShowToastEvent({
              title: "Success!",
              message: "Record has been deleted.",
              variant: "success"
            });
            this.dispatchEvent(toastEvent);
            this.countEditDelete++;
          })
          .catch((error) => {
            console.log(error);
          });
        break;
      case "view":
        this[NavigationMixin.Navigate]({
          type: "standard__recordPage",
          attributes: {
            recordId: row.Id,
            objectApiName: "MyCustomObject__c",
            actionName: "view"
          }
        });
        break;
      default:
        break;
    }
  }

  @wire(searchSObjectRecordsOnSearch,{objectName:'$objectNameGrand', searchTerm:'$searchData', sendedField:'$searchByField'})serachRecordList({ data, error }) {
    if (data) {
      let tempRecs = [];
      data.forEach((record) => {
        let tempRec = Object.assign({}, record);
        tempRec.TempName = "/" + tempRec.Id;
        tempRecs.push(tempRec);
        console.log(tempRec);
      });
      this.allRecordsOfSelectedObject12 = tempRecs;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.allRecordsOfSelectedObject12 = undefined;
    }
  }
  @track filteredInterests;
  searchRecordOnchange(event){
    // const searchKey = event.target.value.toLowerCase();     
    //       this.filteredInterests = this.allRecordsOfSelectedObject.filter(     
    //         (interest) =>     
    //           interest.Name.toLowerCase().includes(searchKey) ||    
    //           interest.Description__c.toLowerCase().includes(searchKey)    
    //       );
    this.searchData=event.target.value;
    this.allRecordsOfSelectedObject=this.allRecordsOfSelectedObject12;
    console.log(this.searchData)
  }
  handleCheckBoxClickFiled(event){
    this.searchByField = event.detail.value;  
    console.log('Select Field :'+this.searchByField)
  }
  @track selectedRowsForDelete=[];
  handleInterestSelect(event) {
     this.selectedRows = event.detail.selectedRows;
      if (this.selectedRows.length > 0) {
        this.selectedRowsForDelete = this.selectedRows;
        this.boolValForButton = true;
      } else {
        this.selectedRowsForDelete = null;
        this.boolValForButton = false;
      }
     console.log('selectedRowsForDelete = '+this.selectedRowsForDelete);
  }

  onclickButton(){
    for (let index = 0; index < this.selectedRows.length; index++) {
      const recordId = this.selectedRows[index].Id;
      deleteRecord(recordId)
          .then(() => {
            const index = this.allRecordsOfSelectedObject.findIndex(
              (record) => record.Id === recordId
            );
            this.allRecordsOfSelectedObject.splice(index, 1);
            const toastEvent = new ShowToastEvent({
              title: "Success!",
              message: "Record has been deleted.",
              variant: "success"
            });
            this.dispatchEvent(toastEvent);
            this.countEditDelete++;
          })
          .catch((error) => {
            console.log(error);
          });
    }
  }

}