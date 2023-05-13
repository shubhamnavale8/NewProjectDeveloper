@istest
public class testLeadDeleteProcess {
	@istest
    public static void testLeadBatchMethod(){
        List<Lead> leadObjectList=new List<Lead>();
        for(Integer leaditr=0; leaditr<20; leaditr++){
            Lead leadObject=new Lead(LastName='Test_Lead_'+leaditr,Company='Test_Company_Lead_'+leaditr ,Status='Closed - Converted');
            leadObjectList.add(leadObject);
        }
        insert leadObjectList;
        
        Test.startTest();
        LeadDeleteProcess leadObjectBatch=new LeadDeleteProcess();
        Database.executeBatch(leadObjectBatch);
        Test.stopTest();
    }
}