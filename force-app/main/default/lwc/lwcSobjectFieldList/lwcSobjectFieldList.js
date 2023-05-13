import { LightningElement,api,track,wire } from 'lwc';
import fetchAllFieldsForSelectedObject from '@salesforce/apex/SObjectController.fetchAllFieldsForSelectedObject';

export default class LwcSobjectFieldList extends LightningElement {
    @track lstFields = [];
    @api lstFields12 = [];
    @api boolValSecond;
    @track arrayToSend = [];
    @api boolValFirst;
    @api objectNameChild='';
    @wire(fetchAllFieldsForSelectedObject,{ strObjectName: '$objectNameChild' })
    fieldListTemp({ error, data }) {
        if (data) {   
            this.lstFields = [];
            for (let key in data) {
                this.lstFields.push({ label: key, value: key,type:'action' });
            }
        } else if (error) {
            console.log('All fields are not fetched');
        }
    }
    handleCheckBoxClick(event) { 
        this.arrayToSend = [];
        for(let index in event.detail.value) {
            this.arrayToSend.push(event.detail.value[index])
        }     
    } 
    onclickButton(){
        this.lstFields12=this.arrayToSend;    
    }
}