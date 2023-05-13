import { LightningElement, api } from 'lwc';

export default class Modal extends LightningElement {
    @api showModal = false;
    @api modalTitle = '';
    @api modalMessage = '';
    @api submitButtonLabel = 'OK';
    @api submitButtonClass = 'slds-button slds-button_brand';

    handleConfirm() {
        this.dispatchEvent(new CustomEvent('modalresult', { detail: { success: true } }));
        this.showModal = false;
    }

    handleCancel() {
        this.dispatchEvent(new CustomEvent('modalresult', { detail: { success: false } }));
        this.showModal = false;
    }
}