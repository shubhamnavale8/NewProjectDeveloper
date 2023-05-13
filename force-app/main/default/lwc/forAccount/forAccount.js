import { LightningElement ,wire,api, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts'
import getAccountRecordsList from '@salesforce/apex/AccountController.getAccountRecordsList'
import { getPicklistValues } from 'lightning/uiObjectInfoApi'
import PICKLIST_FIELD_FIELD from '@salesforce/schema/Account.Industry'
export default class ForAccount extends LightningElement {
    picklistValues = []
    valuess ='';
    @wire(getPicklistValues, {
      recordTypeId: '012000000000000AAA',
      fieldApiName: PICKLIST_FIELD_FIELD,
    })
    getPicklistValuesForField({ data, error }) {
      if (error) {
        // TODO: Error handling
        console.error(error)
      } else if (data) {
        this.picklistValues = [...data.values]
      }
    }
    forChange(event){
      this.valuess=event.detail.value;
    }

    @wire(getAccounts) accounts;
    
    accountidfrmparent;
    
    
    @wire(getAccountRecordsList,{industryObject:'$valuess'}) accountList;
    //console.log(accountList);
    @api handleClick(event){
        event.preventDefault();     
        this.accountidfrmparent = event.target.dataset.accountid;   
    }
}