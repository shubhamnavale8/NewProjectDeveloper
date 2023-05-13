@isTest
public class testDailyLeadUpdateLeadSourceSchedule {
	@isTest
    public static void testMethodDailyLead(){
        List<Lead> leadObjectList=new List<Lead>();
        for(Integer itr=0; itr<200; itr++){
            Lead leadObject=new Lead();
            leadObject.LastName='Test_Lead_'+itr;
            leadObject.Company='Test_Lead_Company_'+itr;
            leadObjectList.add(leadObject);
        }
        Database.insert(leadObjectList,false);
        // Seconds, Minutes ,Hours, Day_of_month, Month, Day_of_week, optional_year
        string schedule='20 30 8 10 2 ?';
        Test.startTest();
        DailyLeadUpdateLeadSourceSchedule dlp =new DailyLeadUpdateLeadSourceSchedule();
        System.schedule('Deaily Lead Update', schedule, dlp);
        Test.stopTest();
        
        Integer itc=[select count() from Lead where LeadSource='Web'];
        System.assertEquals(200, itc);
    }
}