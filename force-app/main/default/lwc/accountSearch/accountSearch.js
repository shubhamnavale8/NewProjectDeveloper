import { LightningElement, wire,api } from 'lwc';
import getAccountRecordsByName from '@salesforce/apex/AccountController.getAccountRecordsByName'
export default class AccountSearch extends LightningElement {
    accountName;
    accObj;
    columns =  [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Phone', fieldName: 'Phone'},
        { label: 'Industry', fieldName: 'Industry'},    
    ];
    @wire(getAccountRecordsByName,{accountNames:'$accountName'}) accountList;
    forChange(event){
        this.accObj=event.target.value;
    }
    forClick(){
        this.accountName=this.accObj;
    }
}