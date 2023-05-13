public with sharing class FutureMethodOfTask {
    @future
    public static void methodForAccount(Id id){
        Account accountObject=[SELECT Id,Name,active_contact_count__c from Account where Id=:id];
        Integer count=[SELECT COUNT() from contact Where AccountId=:accountObject.Id AND Active__c=true];
        accountObject.active_contact_count__c=count;
        update accountObject;
    }
}