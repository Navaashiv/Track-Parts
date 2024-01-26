import { LightningElement, api,track } from 'lwc';

export default class FileUploader extends LightningElement {
    @api myRecordId;

    get encryptedToken() {
        //use apex to get
    }

    get acceptedFormats() {
        return ['.pdf', '.png'];
    }

    handleUploadFinished(event) {
        // Get the list of uploaded files
        const uploadedFiles = event.detail.files;
        //alert('No. of files uploaded : ' + uploadedFiles.length);
        console.log('myRecordId   : ', this.myRecordId)
    }
}