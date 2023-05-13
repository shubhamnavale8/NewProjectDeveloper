@isTest 
public class testCandidateTrigger {
    @testSetup
    public static void setUpMethod(){
        Job_Shubham__c jobObject=new Job_Shubham__c();
        jobObject.RecordTypeId='0122w000000SNg8AAG';
        jobObject.Name__c='tester jobs';
        jobObject.Skills_required__c='C';
        jobObject.Qualification_required__c='BTech';
        Date mydate=date.newInstance(2023, 6, 6);
        jobObject.Expires_ON__c=mydate;
        jobObject.Total_position__c=5;
        jobObject.Active__c=true;
        insert jobObject;
        
    }
    
	@isTest
    public static void testcheckExpectedSalaryMethod(){
        List<Candidate_Shubham__c> candidateObjectList=new List<Candidate_Shubham__c>();
        Job_Shubham__c idOfJobObject=[select Id from Job_Shubham__c];
        List<Candidate_Shubham__c> candiObject=new List<Candidate_Shubham__c>();
        List<Contact> contactObject=new List<Contact>();
        for(Integer itrcandidate=0; itrcandidate<20; itrcandidate++){
            try{
                Candidate_Shubham__c candidateObject=new Candidate_Shubham__c();
                candidateObject.Job_Shubham__c=idOfJobObject.Id;
                candidateObject.Name='Empolyee_'+itrcandidate;
                candidateObject.First_Name__c='Shubham_Test_'+itrcandidate;
                candidateObject.Last_Name__c='Navale_Test_'+itrcandidate;
                candidateObject.Application_Date__c=date.newInstance(2023, 8, 4);
                candidateObject.Expected_Salary__c=null;
                insert candidateObject;
            }
            catch(DmlException ex){
                System.debug('Beacuse of Expected Salary : '+ex.getMessage());
                System.assertEquals(true, ex.getMessage().contains('Expected Salary field is missing'));
            }
        }
        List<Candidate_Shubham__c> checkObject=[select Id from Candidate_Shubham__c]; 
        System.assertEquals(0, checkObject.size());  
    }
    @isTest
    public static void testActiveJobsMethod(){
        List<Candidate_Shubham__c> candidateObjectList=new List<Candidate_Shubham__c>();
        Job_Shubham__c idOfJobObject=[select Id from Job_Shubham__c];
        List<Candidate_Shubham__c> candiObject=new List<Candidate_Shubham__c>();
        List<Contact> contactObject=new List<Contact>();
        for(Integer itrcandidate=0; itrcandidate<20; itrcandidate++){
            Candidate_Shubham__c candidateObject=new Candidate_Shubham__c();
            candidateObject.Job_Shubham__c=idOfJobObject.Id;
            candidateObject.Name='Empolyee_'+itrcandidate;
            candidateObject.First_Name__c='Shubham_Test_'+itrcandidate;
            candidateObject.Last_Name__c='Navale_Test_'+itrcandidate;
            candidateObject.Application_Date__c=date.newInstance(2023, 8, 4);
            candidateObject.Expected_Salary__c=60000;
            candiObject.add(candidateObject);
        }
        Database.insert(candiObject,true);

        List<Candidate_Shubham__c> checkObject=[select Id from Candidate_Shubham__c];
        System.assertEquals(20, checkObject.size());
    }
    @isTest
    public static void testApplicationDateMethod(){

        List<Candidate_Shubham__c> candidateObjectList=new List<Candidate_Shubham__c>();
        Job_Shubham__c idOfJobObject=[select Id from Job_Shubham__c];
        List<Candidate_Shubham__c> candiObject=new List<Candidate_Shubham__c>();
        List<Contact> contactObject=new List<Contact>();
        for(Integer itrcandidate=0; itrcandidate<20; itrcandidate++){
            Candidate_Shubham__c candidateObject=new Candidate_Shubham__c();
            candidateObject.Job_Shubham__c=idOfJobObject.Id;
            candidateObject.Name='Empolyee_'+itrcandidate;
            candidateObject.First_Name__c='Shubham_Test_'+itrcandidate;
            candidateObject.Last_Name__c='Navale_Test_'+itrcandidate;
            candidateObject.Application_Date__c=date.newInstance(2023, 8, 4);
            candidateObject.Expected_Salary__c=60000;
            candiObject.add(candidateObject);
        }
        Database.insert(candiObject,true);
        
        List<Candidate_Shubham__c> checkObject=[select Id, CreatedDate, Application_Date__c from Candidate_Shubham__c];
        for(Candidate_Shubham__c objectCandidate : checkObject){
            Date myDate=date.newInstance(objectCandidate.CreatedDate.year(),objectCandidate.CreatedDate.month(),objectCandidate.CreatedDate.day());
            System.assertEquals(myDate,objectCandidate.Application_Date__c);
        }
    }
}