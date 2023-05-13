@isTest
public class testCampaignStatusUpdateProcess {
    @isTest
    public static void testCampaignBatchMethod(){
        List<Campaign> campaignListObject=new List<Campaign>();
        for(Integer campItr=0; campItr<20; campItr++){
            if(campItr<10){
                Campaign campObject=new Campaign();
                campObject.Name='Test_Campaign_'+campItr;
                campObject.Status='Aborted';
                campaignListObject.add(campObject);
            }
            else{
                Campaign campObject=new Campaign();
                campObject.Name='Test_Campaign_'+campItr;
                campObject.Status='Completed';
                campaignListObject.add(campObject);
            }
        }
        insert campaignListObject;
        Test.startTest();
        CampaignStatusUpdateProcess campBatch=new CampaignStatusUpdateProcess();
        Database.executeBatch(campBatch);
        Test.stopTest();

        List<Campaign> campCheckList=[select Id, Status, Name from Campaign where Status='Completed'];
        System.assertEquals(20, campCheckList.size());
    }
}