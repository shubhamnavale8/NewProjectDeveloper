trigger LeadTrigger on Lead (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore && Trigger.isInsert ){
        //HandlerForLeadTrigger.forAvoidEmailLastNameDateDuplication(Trigger.new);
    }
}