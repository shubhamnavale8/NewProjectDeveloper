import { LightningElement,api,track } from 'lwc';
import fetchAllObjectList from '@salesforce/apex/SObjectController.fetchAllObjectList';
import fetchAllFieldsForSelectedObject from '@salesforce/apex/SObjectController.fetchAllFieldsForSelectedObject';
import fetchAllRecordsOfSelectedObject from '@salesforce/apex/SObjectController.fetchAllRecordsOfSelectedObject';

export default class ObjectsAndRecords extends LightningElement {
    @track lstFields = [];
    @track objectList = [];
    objectName = '';    
    showButton = false;
    arrayToSend = [];
    allRecordsOfSelectedObject = [];
    arrayToSend = [];
    columnsMap=[];

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
        this.lstFields = [];
        this.allRecordsOfSelectedObject = [];
        this.columnsMap=[];
        this.lab=[];
        this.val=[];
        this.arrayToSend=[];
        this.objectName = event.detail.value;
        this.showButton = true
        this.getFieldsOnObjectChange();    
        this.template.querySelector('c-objects-create-field').getFieldsOnObjectChange1();   
    }
    getFieldsOnObjectChange(){
		fetchAllFieldsForSelectedObject({ strObjectName: this.objectName })
		.then(result => {
			this.lstFields = [];
            for (let key in result) {
                this.lstFields.push({ label: key, value: key,type:'action' });
            }
		})
		.catch(error => {
			console.log('All fields are not fetched');
		})
	}

    handleCheckBoxClick(event) { 
        this.arrayToSend = [];
        for(let index in event.detail.value) {
            this.arrayToSend.push(event.detail.value[index])
        }

        const selectedFields = this.arrayToSend; // Array of selected fields
        this.columnsMap = [
        ...selectedFields.map(fieldName => ({
            label: fieldName,
            fieldName: fieldName
        })),
        {
            type: 'action',
            typeAttributes: { rowActions: this.actions }
        }
    ];
       fetchAllRecordsOfSelectedObject({ strObjectName: this.objectName })
       .then(result => {
           this.allRecordsOfSelectedObject = result;
       })
       .catch(error => {
           console.log('error while getting records ' , error);
       })
    } 
    actions = [
        { label: 'View', name: 'view' },
        { label: 'Edit', name: 'edit' },
        { label: 'Delete', name: 'delete' }
    ];
    
}