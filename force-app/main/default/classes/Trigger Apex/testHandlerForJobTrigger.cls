@isTest
public class testHandlerForJobTrigger {
    @testSetup
    public static void setupMethod(){
        List<Job_Shubham__c> jobObjectList=new List<Job_Shubham__c>();
        for(Integer itrJob=0; itrJob<20; itrJob++){
        Job_Shubham__c jobObject=new Job_Shubham__c();
            jobObject.RecordTypeId='0122w000000SNg8AAG';
            jobObject.Name__c='tester jobs'+itrJob;
            jobObject.Skills_required__c='C';
            jobObject.Qualification_required__c='BTech';
            Date mydate=date.newInstance(2023, 6, 6);
            jobObject.Expires_ON__c=mydate;
            jobObject.Total_position__c=5;
            jobObject.Active__c=true;
            jobObjectList.add(jobObject);   
        }
        Database.insert(jobObjectList,false);
    }
    @isTest
    public static void testforActiveStateOfJob(){
        List<Job_Shubham__c> jobObjectList1=[select Id from Job_Shubham__c];
        Database.delete(jobObjectList1,false);
        List<Job_Shubham__c> checkList=[select Id from Job_Shubham__c];
        System.debug(checkList);
        System.assertEquals(20,checkList.size());
    }
    @isTest
    public static void testactiveTrueAfterUpdatePosition(){
        //List<Candidate_Shubham__c> candidateObjectList=new List<Candidate_Shubham__c>();
        Job_Shubham__c jobObjectId=[select Id, Name__c from Job_Shubham__c where Name__c='tester jobs0'];
        List<Contact> contactObject=new List<Contact>();
        for(Integer itrcandidate=0; itrcandidate<7; itrcandidate++){
            try{
                Candidate_Shubham__c candidateObject=new Candidate_Shubham__c();
                candidateObject.Job_Shubham__c=jobObjectId.Id;
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
        Job_Shubham__c jobObjectCheck=[select Id, Name__c,Active__c from Job_Shubham__c where Name__c='tester jobs0'];
        System.assertEquals(false, jobObjectCheck.Active__c);

        Job_Shubham__c jobObjectCheck1=[select Id, Name__c,Active__c from Job_Shubham__c where Name__c='tester jobs0'];
        jobObjectCheck1.Total_position__c=9;
        update jobObjectCheck1;

        Job_Shubham__c jobObjectCheck2=[select Id, Name__c,Active__c from Job_Shubham__c where Name__c='tester jobs0'];
        System.assertEquals(true, jobObjectCheck2.Active__c);
    }
}