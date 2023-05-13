trigger AccountTrigger on Account (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore&& Trigger.isInsert){
        HandlerAccountTrigger.billingToShippingMethod(Trigger.new);
        System.debug(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        
        HandlerAccountTrigger.taskCreatedForActivityMethod(Trigger.new);
        System.debug(Trigger.new);
        
    }
    if(Trigger.isBefore&& Trigger.isUpdate){
        
        HandlerAccountTrigger.changeFieldMethodOnetoAnother(Trigger.new,Trigger.oldMap);
        System.debug(Trigger.new);
        
       
        
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        HandlerAccountTrigger.phoneOfAccountUpdateWithContactMethod(Trigger.newMap,Trigger.oldMap);
        System.debug(Trigger.new);
        
    }
    if(Trigger.isBefore && Trigger.isDelete){
        HandlerAccountTrigger.priventFromDeletMethod(Trigger.old,Trigger.oldMap); 
        HandlerAccountTrigger.sendMailforDeletedAccountMethod(Trigger.oldMap); 
        System.debug(Trigger.old); 
    }
   
    
}