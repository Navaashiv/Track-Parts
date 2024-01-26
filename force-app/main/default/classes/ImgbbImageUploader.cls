public class ImgbbImageUploader {
    
    @future(callout=true)
    public static void uploadImageToImgBB(String base64Text) {
        String imgurl = 'https://api.imgbb.com/1/upload';
        String apiKey = '9b792679aef57d625a2c29eecb3185ec';
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(imgurl + '?key=' + apiKey);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'multipart/form-data; boundary=boundary_string');
        request.setHeader('Accept', 'application/json');
        
        // Construct the form-data body
        String boundary = 'boundary_string';
        String body = '--' + boundary + '\r\n';
        body += 'Content-Disposition: form-data; name="image"\r\n\r\n';
        body += base64Text + '\r\n';
        body += '--' + boundary + '--';
        
        // Set the request body with the form-data
        request.setBodyAsBlob(Blob.valueOf(body));
        
        // Create the HTTP instance and send the request
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        // Handle the response
        if (response.getStatusCode() == 200) {
            // Successfully uploaded to ImgBB
            System.debug('ImgBB Response: ' + response.getBody());
            
            // Extract URL from the response
            String imageUrl = extractImageUrl(response.getBody());
            system.debug('imageUrl   : '+imageUrl);
            updateUrlField(imageUrl);
        } else {
            
            System.debug('ImgBB Upload Failed. Response Code: ' + response.getStatusCode() + ', Response Body: ' + response.getBody());
        }
    }
    
    private static String extractImageUrl(String responseBody) {
        Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(responseBody);  
        if (jsonResponse.containsKey('data')) {
            Map<String, Object> dataMap = (Map<String, Object>)jsonResponse.get('data');
            
          
            if (dataMap.containsKey('url')) {
                String imageUrl = (String)dataMap.get('url');
                System.debug('ImgBB Image URL: ' + imageUrl);
                return imageUrl;
            } else {
                System.debug('No "url" key found in the "data" map.');
            }
        } else {
            System.debug('No "data" key found in the JSON response.');
        }
        return null;
    }
    public static void updateUrlField(String imageUrl) {
        Purchase__c lastUploadedRecord = [SELECT Id, Drive_url__c FROM Purchase__c ORDER BY CreatedDate DESC LIMIT 1];
        
        // Check if a record is found
        if (lastUploadedRecord != null) {
            // Update the Drive_url__c field with the extracted image URL
            lastUploadedRecord.Drive_url__c = imageUrl;
            
            // Update the record in Salesforce
            update lastUploadedRecord;
            
            System.debug('Updated Salesforce record with URL: ' + imageUrl + ' for Purchase__c record Id: ' + lastUploadedRecord.Id);
        } else {
            System.debug('No Purchase__c record found.');
        }
    }
    
}