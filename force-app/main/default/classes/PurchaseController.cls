public class PurchaseController {
    public static void afterUpdate(list<purchase__C> newValues){
        string DriveUrl ;
        List<purchase__C> updatedValues = new List<purchase__C>();
        for(purchase__C pur : newValues){
          DriveUrl = pur.Drive_url__c;
        }
        if(DriveUrl != ''){
            system.debug(' DriveUrl   '+DriveUrl);
            DeleteContent.deleteContents();
        }
    }
}