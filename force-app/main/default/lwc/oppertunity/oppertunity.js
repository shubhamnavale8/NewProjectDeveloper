import { LightningElement,api,wire } from 'lwc';
import getOpportunityRecord from '@salesforce/apex/OppertunityController.getOpportunityRecord'
export default class Oppertunity extends LightningElement {
    columns =  [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Stage Name', fieldName: 'StageName'},
        { label: 'Amount', fieldName: 'Amount' },
        { label: 'Probability', fieldName: 'Probability' },
        { label: 'Expected Revenue', fieldName: 'ExpectedRevenue' },
        { label: 'Total Opportunity Quantity', fieldName: 'TotalOpportunityQuantity' },
        { label: 'Close Date', fieldName: 'CloseDate' },    
    ];
    @api accountIds;
    @wire(getOpportunityRecord,{accountId:'$accountIds'}) oppertunityObject;
}