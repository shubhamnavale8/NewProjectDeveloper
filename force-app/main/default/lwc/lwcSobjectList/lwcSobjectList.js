import { LightningElement,track } from 'lwc';
import fetchAllObjectList from '@salesforce/apex/SObjectController.fetchAllObjectList';
export default class LwcSobjectList extends LightningElement {
    @track objectName = '';
    @track objectList = [];
    @track filedList=[];
    @track boolValue=true;
    connectedCallback() { 
        fetchAllObjectList()
        .then((result) => {
            if (result) {
                this.objectList = [];
                for (let key in result ) {
                    this.objectList.push({ label: key, value: key });
                }
            } else {
                console.log('Objects are not found')
            }
        }).catch((error) => {
            console.log('Objects are not found')
        });
    }
    onObjectChange(event) { 
        this.boolValue=false;
        this.filedList=[];
        this.objectName = event.detail.value;  
    }
}