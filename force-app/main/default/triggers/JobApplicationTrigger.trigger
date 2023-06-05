trigger JobApplicationTrigger on Job_Application__c (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore &&  Trigger.isInsert){
        JobAppliationTriggerHandler.beforeInsertStatusNewPosition(Trigger.new);
    }
    if(Trigger.isBefore &&  Trigger.isUpdate){
        JobAppliationTriggerHandler.afterPositionVancancyFull(Trigger.new,Trigger.oldMap);
    }
}