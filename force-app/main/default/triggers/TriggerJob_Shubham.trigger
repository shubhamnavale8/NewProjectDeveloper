trigger TriggerJob_Shubham on Job_Shubham__c (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        HandlerForJobTrigger.forActiveStateOfJob(Trigger.old);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        HandlerForJobTrigger.activeTrueAfterUpdatePosition(Trigger.new);
    }
}