@isTest
public class testcandidateTriggerOfApplicant {
    @testSetup
    public static void testSteupCandidate(){
        Contact contactObject=new Contact();
        contactObject.LastName='Navale_test';
        contactObject.FirstName='Shubham_Test';
        contactObject.Email='shubham.navale8@gmail.com';
        insert contactObject;
        Contact contactObjectForjob=[select Id from Contact where LastName='Navale_test'];
        Job_Shubham__c jobObject=new Job_Shubham__c();
        jobObject.RecordTypeId='0122w000000SNg8AAG';
        jobObject.Name__c='tester jobs';
        jobObject.Skills_required__c='C';
        jobObject.Qualification_required__c='BTech';
        Date mydate=date.newInstance(2023, 6, 6);
        jobObject.Expires_ON__c=mydate;
        jobObject.Total_position__c=5;
        jobObject.Active__c=true;
        jobObject.Manager__c=contactObjectForjob.Id;
        Database.insert(jobObject,false);
        List<Candidate_Shubham__c> candidateObjectList=new List<Candidate_Shubham__c>();
        Job_Shubham__c idOfJobObject=[select Id from Job_Shubham__c];
        List<Candidate_Shubham__c> candiObject=new List<Candidate_Shubham__c>();
        
        for(Integer itrcandidate=0; itrcandidate<7; itrcandidate++){
            try{
            Candidate_Shubham__c candidateObject=new Candidate_Shubham__c();
            candidateObject.Job_Shubham__c=idOfJobObject.Id;
            candidateObject.Name='Empolyee_'+itrcandidate;
            candidateObject.First_Name__c='Shubham_Test_'+itrcandidate;
            candidateObject.Last_Name__c='Navale_Test_'+itrcandidate;
            candidateObject.Application_Date__c=date.newInstance(2023, 8, 4);
            candidateObject.Expected_Salary__c=60000;
            //candiObject.add(candidateObject);
            insert candidateObject;
            }
            catch(DmlException ex){
                System.debug('Job is now DeActive so error Occur : '+ex.getMessage());
            }
        }
    }
    
	@isTest
    public static void testcandidateNumberMatchApplicant(){
        Job_Shubham__c jobObject=[select Id, Active__c from Job_Shubham__c];
        List<Candidate_Shubham__c> canObject=[select Id , Job_Shubham__c, Name from Candidate_Shubham__c];
        System.debug('job id'+jobObject);
        System.debug('candidate := '+canObject);
        //System.assertEquals(false,jobObject.Active__c); 
        System.assertEquals(1, Limits.getEmailInvocations());
        System.assertNotEquals(0, Limits.getEmailInvocations());
        //System.assertEquals(true, HandlerForCandidateTrigger.candidateNumberMatchApplicant());
    }
}