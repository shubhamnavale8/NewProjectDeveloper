@isTest
public class AccountTriggerNewTest {
    @isTest
    public static void onIndustryRatingChange(){
        List<Account> accountLst=TestDataFactoryAccount.getAccount();
        Database.insert(accountLst,false);
        List<Account> accResultLst=[select Id,Name ,Industry from Account where Name like 'Test_%'];
        for(Account objAcc:accResultLst){
            System.assertEquals(objAcc.Industry, 'Hot');
        }
    }
    @isTest
    public static void onAccountOpportunityCreate(){
        List<Account> accountLst=TestDataFactoryAccount.getAccount();
        Database.insert(accountLst,false);
        List<Account> accResultLst=[select Id,Name ,Industry from Account where Name like 'Test_%'];
        List<Opportunity> oppLst=[select Id,Name,AccountId ,StageName ,CloseDate from Opportunity where Name like 'Created through trigger%'];
        for(Opportunity objOpp:oppLst){
            System.assertEquals(objOpp.StageName, 'Prospecting');
            System.assertEquals(objOpp.CloseDate, Date.newInstance(2024, 02, 20));
        }
    }
    @isTest
    public static void descriptionUpdateTestMethod(){
        List<Account> accountLst=TestDataFactoryAccount.getAccount();
        Database.insert(accountLst,false);
        List<Account> accResultLst=[select Id,Name ,Industry,Phone,Description from Account where Name like 'Test_%'];
        List<Account> accUpdateLst=new List<Account>();
        for(Account objAcc:accResultLst){
            objAcc.Phone='1234567890';
            accUpdateLst.add(objAcc);
        }
        Database.update(accUpdateLst,false);

        List<Account> accUpdateResultLst=[select Id,Name ,Industry,Phone,Description from Account where Name like 'Test_%'];
        Map<Id,Account> mapAccLst=new Map<Id,Account>(accResultLst);
        for(Account accObj:accUpdateResultLst){
            System.assertEquals('Phone is Updated from  '+mapAccLst.get(accObj.Id).Phone +' to '+accObj.Phone, accObj.Description);
        }
    }
}