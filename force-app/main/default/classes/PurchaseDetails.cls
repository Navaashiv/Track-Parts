public class PurchaseDetails {

    @AuraEnabled(Cacheable=true)
    public static List<Purchase__c> returnDetails(String searchPurchase) {
        String searchTerm = '%' + String.escapeSingleQuotes(searchPurchase) + '%';

        List<Purchase__c> allpurchasedetails = [SELECT Id, Actual_Rate_buyed__c, Invoice_Number__c, Name, Product_image__c, Quantity__c, Sell_Rate__c, Total_Amount_Bought__c 
                                                FROM Purchase__c 
                                                WHERE Name LIKE :searchTerm LIMIT 5];

        return allpurchasedetails;
    }

    @AuraEnabled(Cacheable=true)
    public static List<Purchase__c> getDetails(String recordId) {
        List<Purchase__c> allpurchasedetails = [SELECT Id, Actual_Rate_buyed__c, Invoice_Number__c, Name, Product_image__c, Quantity__c, Sell_Rate__c, Total_Amount_Bought__c 
                                                FROM Purchase__c 
                                                WHERE Id = :recordId LIMIT 1];

        return allpurchasedetails;
    }  
}