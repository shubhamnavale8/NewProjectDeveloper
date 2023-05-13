trigger BookTrigger on Book_Details__c (after Undelete) {
    if(Trigger.isAfter && Trigger.isUndelete){
        HandlerClassForBookDetails.afterUndeleteChangeStatusMethod(Trigger.new);
    }
}