public class DeleteContent {
    public static void deleteContents() {
        List<ContentDocument> documents = [SELECT Id FROM ContentDocument];

        if (!documents.isEmpty()) {
            List<Id> contentIds = new List<Id>();
            
            for (ContentDocument doc : documents) {
                contentIds.add(doc.Id);
            }

            // Use Database.delete with allOrNone set to false
            Database.DeleteResult[] deleteResults = Database.delete(contentIds, false);

            // Iterate over the results to check for errors
            for (Database.DeleteResult result : deleteResults) {
                if (!result.isSuccess()) {
                    // Handle errors, log or throw an error message
                    for (Database.Error error : result.getErrors()) {
                        System.debug('Error deleting record: ' + error.getMessage());
                    }
                }
            }
        }
    }
}