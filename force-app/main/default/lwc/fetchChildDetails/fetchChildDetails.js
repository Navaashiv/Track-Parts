import { LightningElement,api, wire  } from 'lwc';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import PURCHASE_NAME from "@salesforce/schema/Purchase__c.Name";
import ACTUAL_RATE from "@salesforce/schema/Purchase__c.Actual_Rate_buyed__c";
import INVOICE_NO from "@salesforce/schema/Purchase__c.Invoice_Number__c";
import PRODUCT_IMAGE from "@salesforce/schema/Purchase__c.Drive_url__c";
import QUANTITY from "@salesforce/schema/Purchase__c.Quantity__c";
import SELL_RATE from "@salesforce/schema/Purchase__c.Sell_Rate__c";
import TOTAL_AMOUNT from "@salesforce/schema/Purchase__c.Total_Amount_Bought__c";

const fields = [PURCHASE_NAME,ACTUAL_RATE,INVOICE_NO,PRODUCT_IMAGE,QUANTITY,SELL_RATE,TOTAL_AMOUNT];
export default class FetchChildDetails extends LightningElement {
    @api recordselectedid;
    @wire(getRecord, { recordId: "$recordselectedid", fields })
    purchase;
    get purchaseName(){
        return getFieldValue(this.purchase.data, PURCHASE_NAME);
    }
    get actualrate(){
        return getFieldValue(this.purchase.data, ACTUAL_RATE);
    }
    get invoiceno(){
        return getFieldValue(this.purchase.data, INVOICE_NO);
    }
  
    get driveurl(){
        return getFieldValue(this.purchase.data, PRODUCT_IMAGE);
    }
    get quantity(){
        return getFieldValue(this.purchase.data, QUANTITY);
    }
    get sellrate(){
        return getFieldValue(this.purchase.data, SELL_RATE);
    }
    get totalamountbudget(){
        return getFieldValue(this.purchase.data, TOTAL_AMOUNT);
    }
}