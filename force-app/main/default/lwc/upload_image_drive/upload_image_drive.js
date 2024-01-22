import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import PURCHASE_NAME from "@salesforce/schema/Purchase__c.Name";

export default class Upload_image_drive extends LightningElement {
    @api myRecordId;
    @wire(getRecord, { recordId: '$myRecordId', fields: [PURCHASE_NAME] })
    record;
    
    imageFile = '';

    get acceptedFormats() {
        return ['.pdf', '.png', '.jpg', '.jpeg', '.gif', '.bmp', '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.txt'];
    }

    handleUploadFinished(event) {
        // Get the list of uploaded files
        const uploadedFiles = event.detail.files;
        alert('No. of files uploaded : ' + uploadedFiles.length);

        // Access the Name field value from the record
        const recordName = getFieldValue(this.record.data, PURCHASE_NAME);
        console.log('Record Name:', recordName);

        this.imageFile = recordName;
    }
}