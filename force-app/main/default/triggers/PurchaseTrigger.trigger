trigger PurchaseTrigger on Purchase__c (after update) {
    switch on Trigger.operationType{
        when AFTER_UPDATE{
            PurchaseController.afterUpdate(Trigger.new);
        }
    }
}