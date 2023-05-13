public class ExpireJobInactiveScheduler implements Schedulable {
    public static void execute(SchedulableContext sc){
        List<Job_Shubham__c> jobObjectList=[SELECT Expires_ON__c, Id, Name FROM Job_Shubham__c where Expires_ON__c < TODAY];
        List<Job_Shubham__c> jobListUpdate=new List<Job_Shubham__c>();
        for(Job_Shubham__c jobObject:jobObjectList){
            jobObject.Active__c=false;
            jobListUpdate.add(jobObject);
        }
        Database.update(jobListUpdate);
        
    }
}