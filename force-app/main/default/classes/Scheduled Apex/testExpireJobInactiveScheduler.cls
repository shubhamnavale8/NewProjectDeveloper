@isTest
public class testExpireJobInactiveScheduler {
	@isTest
    public static void testMethodForJobExpire(){
        List<Job_Shubham__c> jobObjectList=new List<Job_Shubham__c>();
        for(Integer itr=0; itr<20;itr++){
            Job_Shubham__c jobObject=new Job_Shubham__c();
        	jobObject.RecordTypeId='0122w000000SNg8AAG';
        	jobObject.Name__c='tester_jobs'+itr;
        	jobObject.Skills_required__c='C';
        	jobObject.Qualification_required__c='BTech';
       	 	Date mydate=date.newInstance(2023, 4, 4);
        	jobObject.Expires_ON__c=mydate;
        	jobObject.Total_position__c=5;
	        jobObject.Active__c=true;
            jobObjectList.add(jobObject);
        }
        Database.insert(jobObjectList);
        string schedule='0 0 0 17 4 ?';
        Test.startTest();
        ExpireJobInactiveScheduler expObject=new ExpireJobInactiveScheduler();
        System.schedule('Job Expire On Schedule', schedule, expObject);
        Test.stopTest();
        List<Job_Shubham__c> jobCheckObjectList=[select Id ,Expires_ON__c,Active__c from Job_Shubham__c where Name Like 'tester_jobs%'];
        System.debug(jobCheckObjectList);
        for(Job_Shubham__c jobCheck:jobCheckObjectList){
            System.assertEquals(false, jobCheck.Active__c);
        }
    }
}