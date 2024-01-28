import { LightningElement, wire } from 'lwc';
import getPurchaseDetails from '@salesforce/apex/PurchaseDetails.returnDetails';

export default class FetchDetails extends LightningElement {
    searchKey = '';
    selectedRecordId;

    // Assume you have a wire adapter to fetch purchase data based on searchKey
    @wire(getPurchaseDetails, { searchPurchase: '$searchKey' })
    purchase;
    props = ''
    handleKeyChange(event) {
        this.searchKey = event.target.value;
    }
    handlePurchaseClick(event){
        this.selectedRecordId = event.target.dataset.id;

        // Now you can use the selectedId as needed
        console.log('Selected ID:', this.selectedRecordId);
        this.props = this.selectedRecordId;
       
    }

}