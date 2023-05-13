trigger TriggerCandidate_Shubham on Candidate_Shubham__c (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore && Trigger.isInsert){
        HandlerForCandidateTrigger.validateSalaryMethod(Trigger.new);
        HandlerForCandidateTrigger.ActiveJobsMethod(Trigger.new);
       
    }
    if(Trigger.isAfter && Trigger.isInsert){
        HandlerForCandidateTrigger.ApplicationDateMethod(Trigger.new);
        HandlerForCandidateTrigger.candidateNumberMatchApplicant(Trigger.new); 
    }
}
//select ID,RecordTypeId from Job_Shubham__c