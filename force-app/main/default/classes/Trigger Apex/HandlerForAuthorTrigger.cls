public class HandlerForAuthorTrigger {
    public static void ownerUpdateDescriptionMethod(List<Author__c> authorObjectList){
        for(Author__c authorObject:authorObjectList){
            User userObject=[select Id, Name from User where Id=:authorObject.OwnerId];
            authorObject.Description__c=userObject.Name;
        }
    }
}