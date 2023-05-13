import { LightningElement,api,track,wire } from 'lwc';
import fetchAllFieldsForSelectedObject from '@salesforce/apex/SObjectController.fetchAllFieldsForSelectedObject';
import fetchAllRecordsOfSelectedObject from '@salesforce/apex/SObjectController.fetchAllRecordsOfSelectedObject';
import deleteTheRecord from '@salesforce/apex/SObjectController.deleteTheRecord';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { deleteRecord } from 'lightning/uiRecordApi';
import { getRecord } from 'lightning/uiRecordApi';

export default class ObjectsCreateField extends NavigationMixin(LightningElement) {
    recordIdToDelete='0012w00001VV0ChAAL';
    @track lstFields1 = [];
    @api arrayToSend1 = [];
    @api objectNameOne = 'Account';
    @api allRecordsOfSelectedObject1 = [];
    @api columnsMap=[];
    @api lab=[];
    @api val=[];
    @api TempName=[];
    actions = [
        { label: 'View', name: 'view' },
        { label: 'Edit', name: 'edit' },
        { label: 'Delete', name: 'delete' }
    ];
    @track recordIds;

    @wire(getRecord, { recordId: '$recordIdToDelete', fields: ['$strs'] })
    record;

    connectedCallback() {
        this.strs = this.objectNameOne + '.Id';
    }

    handleEditClick(event) {
        const recordId = event.target.dataset.recordId;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                objectApiName: 'MyCustomObject__c',
                actionName: 'edit'
            }
        });
    } 
    showDeleteConfirmation(){

        return true;
    }
    @api getFieldsOnObjectChange1(){
        fetchAllFieldsForSelectedObject({ strObjectName: this.objectNameOne })
		.then(result => {
			this.lstFields1 = [];
            for (let key in result) {
                this.lstFields1.push({ label: key, value: key,type:'action' });
            }
		})
		.catch(error => {
            console.log('Object Name'+this.objectNameOne);
			console.log('All fields are not fetched');
		})
    }
    handleCheckBoxClick1(event) { // getting proxy in event.detail.value
        this.arrayToSend1 = [];
        for(let index in event.detail.value) {
            this.arrayToSend1.push(event.detail.value[index])
        }  
        const selectedFields = this.arrayToSend1; // Array of selected fields
        this.columnsMap = [
            ...selectedFields.map(fieldName => ({
                label: fieldName,
                fieldName: fieldName==='Name'?'TempName':fieldName,
        type: fieldName === 'Name' ? 'url' : 'text',
        typeAttributes: {
          label: {
            fieldName: 'Name',
            target: '_blank'
          }
        }
            })),
            {
                type: 'action',
                typeAttributes: { rowActions: this.actions }
            }
        ];    
       fetchAllRecordsOfSelectedObject({ strObjectName: this.objectNameOne })
		.then(result => {
			this.allRecordsOfSelectedObject1 = result;
		})
		.catch(error => {
			console.log('error while getting records ' , error);
		})
    } 
    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        switch (actionName) {
            case 'edit':
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: row.Id,
                        objectApiName: 'MyCustomObject__c',
                        actionName: 'edit'
                    }
                });
                break;
            case 'delete':
                this.recordIdToDelete = row.Id;
                deleteRecord(this.record.data.id)
            .then(() => {
                // Record deleted successfully
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Record is Deleted',
                        variant: 'success',
                    }),
                );
            })
            .catch((error) => {
                // Error occurred while deleting record
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Somthing went Wrong',
                        message: 'Record is Not Deleted',
                        variant: 'error',
                    }),
                );
            });
                // showDeleteConfirmation();
                // deleteTheRecord({ objName: this.objectNameOne,recordId:this.recordIdToDelete })
                // .then(result => {
                //        if(result==true){
                //         this.dispatchEvent(
                //             new ShowToastEvent({
                //                 title: 'Success',
                //                 message: 'Record is Deleted',
                //                 variant: 'success',
                //             }),
                //         );
                //        }
                //        else{
                //         this.dispatchEvent(
                //             new ShowToastEvent({
                //                 title: 'Somthing went Wrong',
                //                 message: 'Record is Not Deleted',
                //                 variant: 'error',
                //             }),
                //         );
                //        }   
                //     })
                //     .catch(error => {
                //         this.dispatchEvent(
                //             new ShowToastEvent({
                //                 title: 'Error creating record',
                //                 message: error.body.message,
                //                 variant: 'error',
                //             }),
                //         );
                //     });

                
                break;
            case 'view':
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: row.Id,
                        objectApiName: 'MyCustomObject__c',
                        actionName: 'view'
                    }
                });
                break;
            default:
                break;
        }  
    } 
    handleDelete() {
        
    }  

    @wire(fetchAllRecordsOfSelectedObject, { strObjectName: "$objectName" })
    wiredObjectRecords({ data, error }) {
    if (data) {
      let tempRecs = [];
      data.forEach((record) => {
        let tempRec = Object.assign({}, record);
        tempRec.TempName = "/" + tempRec.Id;
        tempRecs.push(tempRec);
        console.log(tempRec);
      });
      this.allRecordsOfSelectedObject1 = tempRecs;
     this.error = undefined;
    } else if (error) {
      this.error = error;
      this.allRecordsOfSelectedObject = undefined;
    }
  }


}