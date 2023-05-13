trigger AuthorTrigger on Author__c (before insert,after insert,after update,after delete) {
    if(Trigger.isBefore&& Trigger.isInsert){
        HandlerForAuthorTrigger.ownerUpdateDescriptionMethod(Trigger.new);
    }
}