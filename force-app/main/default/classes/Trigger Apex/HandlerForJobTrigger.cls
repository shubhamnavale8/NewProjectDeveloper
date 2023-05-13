public class HandlerForJobTrigger {
    public static void forActiveStateOfJob(List<Job_Shubham__c> jobObjectList){
        for(Job_Shubham__c jobObject: jobObjectList){
            if(jobObject.Active__c==true){
                jobObject.Id.addError('This Job is active and cannot be deleted');
            }
        }
    }
    public static void activeTrueAfterUpdatePosition(List<Job_Shubham__c> jobObjectList){
        for(Job_Shubham__c jobObject:jobObjectList){
            if(jobObject.Total_position__c > jobObject.Hired_Applicants__c){
                jobObject.Active__c=true;
            }
        }
    } 
}