import { LightningElement,api,track,wire } from 'lwc';
import { getRecord, getFieldValue, } from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';
import EMAIL_FIELD from '@salesforce/schema/Lead.Email';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';
import LEAD_SOURCE_FIELD from '@salesforce/schema/Lead.LeadSource';
import DESCRIPTION_FIELD from '@salesforce/schema/Lead.Description';
import getInterests from '@salesforce/apex/LeadAndIntrestController.getInterests';
import addInterestsToLead from '@salesforce/apex/LeadAndIntrestController.addInterestsToLead';
import getInterestsOnSearch from '@salesforce/apex/LeadAndIntrestController.getInterestsOnSearch';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class LeadRecordMainPage extends LightningElement {
    @api recordId;
    @track searchData=' ';
    @track showButton=false;
    @track selectedInterestId=null;
    @track interests123;
    fieldList1=['Email','Company'];
    fieldList2=['Email','Company','Description','LeadSource'];
    @wire(getRecord, { recordId: '$recordId', fields: [EMAIL_FIELD, COMPANY_FIELD, LEAD_SOURCE_FIELD, DESCRIPTION_FIELD] })
    lead;

    get email() {
        return getFieldValue(this.lead.data, EMAIL_FIELD);
    }
    get company() {
        return getFieldValue(this.lead.data, COMPANY_FIELD);
    }
    get leadSource() {
        return getFieldValue(this.lead.data, LEAD_SOURCE_FIELD);
    }
    get description() {
        return getFieldValue(this.lead.data, DESCRIPTION_FIELD);
    }
    @track interests12;
    columns = [
        { label: 'Name', fieldName: 'Name', editable:true },
        { label: 'Description', fieldName: 'Description__c', editable:true},
        { label: 'Interest Type', fieldName: 'Interest_Type__c', editable:true }    
    ];
    @track casesSpinner=true;
    @wire(getInterests)
    Wireinterests({ error, data }) {
      if (data) {
          this.interests12 = data;
          this.casesSpinner = false;
          if (!this.dtLoading) {
              this._tableHeight = 'height: 500px;';
          }
      } else if (error) {
          this.error = error;
          this.dtLoading = false;
      }
  }

    @wire(getInterestsOnSearch,{searchStr:'$searchData'})
    Wireinterests12({ error, data }) {
      if (data) {
          this.interests123 = data;
          this.casesSpinner = false;
          if (!this.dtLoading) {
              this._tableHeight = 'height: 500px;';
          }
      } else if (error) {
          this.error = error;
          this.dtLoading = false;
      }
  }
    handleSearchChange(event) {
          // const searchKey = event.target.value.toLowerCase();     
          // this.filteredInterests = this.interests.filter(     
          //   (interest) =>     
          //     interest.Name.toLowerCase().includes(searchKey) ||    
          //     interest.Description__c.toLowerCase().includes(searchKey)    
          // ); 
          this.searchData=event.target.value;
          this.interests12=this.interests123;
          console.log(this.searchData);
        }
   
    handleInterestSelect(event) {
          const selectedRows = event.detail.selectedRows;
            if (selectedRows.length > 0) {
              this.selectedInterestId = selectedRows[0].Id;
              this.showButton = true;
            } else {
              this.selectedInterestId = null;
              this.showButton = false;
            }
           console.log('selectedInterestId')
    }
    handleSubmit() {
          if (this.selectedInterestId) {
            addInterestsToLead({
            leadId: this.recordId,
            interestId: this.selectedInterestId 
           }) 
            .then(() => {   
             //this.message =     
             // "Lead updated successfully with the selected interest record.";    
             const event = new ShowToastEvent({      
              title: 'Success',       
              message: 'Interest is Added in Lead',       
              variant: 'success',       
              mode: 'dismissable'       
            });     
            this.dispatchEvent(event);     
            })       
            .catch((error) => {    
              const event = new ShowToastEvent({      
                title: 'Error',       
                message: 'This Lead Already having Interest',       
                variant: 'Error',       
                mode: 'dismissable'       
              });     
              this.dispatchEvent(event);      
             console.error(error);       
             this.message = "Error updating the lead. Please try again.";       
            });        
          } else {        
           this.message = "Please select an interest record.";
          }
    }

    LeadUpdate1(event){
       const evt = new ShowToastEvent({
        title: 'Application Form Status',     
        message: 'Lead updated Successfully',     
        variant: 'success',     
        mode: 'dismissable'     
      });     
      this.dispatchEvent(evt);     
      }
      
}