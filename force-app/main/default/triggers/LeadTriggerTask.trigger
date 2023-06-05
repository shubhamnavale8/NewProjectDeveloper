trigger LeadTriggerTask on Lead (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore && Trigger.isInsert){
        LeadTriggerTaskHandler.pritendEmailDuplicationLeadInsert(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        LeadTriggerTaskHandler.pritendEmailDuplicationLeadUpdate(Trigger.newMap);
    }
}