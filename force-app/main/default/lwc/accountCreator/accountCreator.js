import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import DESC_FIELD from '@salesforce/schema/Account.Description';
import WEB_FIELD from '@salesforce/schema/Account.Website';
import EMP_FIELD from '@salesforce/schema/Account.NumberOfEmployees';
export default class AccountCreator extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;
    fields = [NAME_FIELD, INDUSTRY_FIELD, DESC_FIELD, WEB_FIELD, EMP_FIELD];

    handleSuccess(event){
        const toastEvent = new ShowToastEvent({
            title: "Account Created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}