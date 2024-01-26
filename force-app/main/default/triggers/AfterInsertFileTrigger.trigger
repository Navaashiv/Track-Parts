trigger AfterInsertFileTrigger on ContentVersion (after insert) {
    // Collect the IDs of the inserted files
    // 
      String base64Text;
    Set<Id> insertedFileIds = new Set<Id>();
    for (ContentVersion cv : Trigger.new) {
        insertedFileIds.add(cv.Id);
    }
    
    // Query for the VersionData of the inserted files
    List<ContentVersion> insertedFilesWithVersionData = [SELECT Id, VersionData
                                                        FROM ContentVersion
                                                        WHERE Id IN :insertedFileIds];
    
    // Process the VersionData as needed
    for (ContentVersion cvWithVersionData : insertedFilesWithVersionData) {
        Blob versionDataBlob = cvWithVersionData.VersionData;
         base64Text = EncodingUtil.base64Encode(cvWithVersionData.VersionData);
        system.debug('base64Text  : '+base64Text);

    }
    ImgbbImageUploader.uploadImageToImgBB(base64Text);
}