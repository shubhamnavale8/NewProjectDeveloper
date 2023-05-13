import { LightningElement,track } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
export default class ForAccountCreateLWC extends LightningElement {
    @track accoutObj={fname:'',phoned:''};
    handleChange(event){
        if(event.target.label=='Name'){
            this.accoutObj.fname =  event.target.value;
        }
        if(event.target.label=='Phone'){
            this.accoutObj.phoned = event.target.value;
        }
    }
    createAccount(){
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.accoutObj.fname;
        fields[PHONE_FIELD.fieldApiName] = this.accoutObj.phoned;
        const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };
        createRecord(recordInput)
        .then(account => {
            this.accountId = account.id;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Account created',
                    variant: 'success',
                }),
            );
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: account.id,
                    objectApiName: 'Account',
                    actionName: 'view'
                },
            });
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.body.message,
                    variant: 'error',
                }),
            );
        });
    }
}