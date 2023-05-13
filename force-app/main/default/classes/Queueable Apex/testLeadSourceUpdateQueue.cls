@isTest
public class testLeadSourceUpdateQueue {
	@isTest
    public static void testUpdateMethod(){
        List<Lead> leadObjectList=new List<Lead>();
        for(Integer leaditr=0; leaditr<50; leaditr++){
            Lead leadObject=new Lead(LastName='Test_Lead_'+leaditr,Company='Test_Company_Lead_'+leaditr ,Status='Closed - Converted');
            leadObjectList.add(leadObject);
        }
        insert leadObjectList;
       
        LeadSourceUpdateQueue leadQueue = new LeadSourceUpdateQueue();
        Test.startTest();
        System.enqueueJob(leadQueue);
        Test.stopTest();
		System.assertEquals(50, [select count() from Lead where LeadSource='web']);
    }
}