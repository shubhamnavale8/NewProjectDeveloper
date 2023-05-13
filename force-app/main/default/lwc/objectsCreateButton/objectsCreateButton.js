import { LightningElement,api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class ObjectsCreateButton extends NavigationMixin(LightningElement) {
    @api objectApiName = '';

    handleClick() {
        console.log('button record name '+this.objectApiName);
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: this.objectApiName,
                actionName: 'new'
            }
        });
    }
}