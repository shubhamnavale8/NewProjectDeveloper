trigger ContactTriggerTask on Contact (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(Trigger.isBefore && Trigger.isInsert ){
        
        HandlerContactTriggerTask.forCheckPhoneEmailMethod(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate ){
        HandlerContactTriggerTask.forCheckPhoneEmailMethod(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isDelete ){
        HandlerContactTriggerTask.forMethodForDeleteUndelete(Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUndelete ){ 
        HandlerContactTriggerTask.forMethodForDeleteUndelete(Trigger.new);
    }
}