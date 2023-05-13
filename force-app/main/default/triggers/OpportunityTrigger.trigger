trigger OpportunityTrigger on Opportunity (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(Trigger.isAfter && Trigger.isInsert){
        OpportunityHandler.opportunityInsertMethod(Trigger.newMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityHandler.opportunityUpdateMethod(Trigger.newMap);
    }
    if(Trigger.isAfter && Trigger.isDelete){
        OpportunityHandler.opportunityDeleteMethod(Trigger.oldMap);
    }
    if(Trigger.isAfter && Trigger.isUndelete){
        OpportunityHandler.opportunityUndeleteMethod(Trigger.newMap);
    }
}