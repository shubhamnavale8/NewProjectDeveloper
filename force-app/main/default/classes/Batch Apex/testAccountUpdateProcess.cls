@isTest
public with sharing class testAccountUpdateProcess {
    @isTest
    public static void testAccountUpdateBatchMethod(){
        List<Account> accountObjectList=new List<Account>();
        for(Integer accountItr=0; accountItr<20; accountItr++){
            Account accountObject=new Account();
            accountObject.Name='Shubham_test_'+accountItr;
            accountObject.Status__c=false;
            accountObjectList.add(accountObject);
        }
        Database.insert(accountObjectList,false);
        List<Account> accountObjectListBatch=[select Id,Name,Status__c from Account];
        Test.startTest();
        AccountUpdateProcess batchObjectForAccount=new AccountUpdateProcess();
        Database.executeBatch(batchObjectForAccount);
        Test.stopTest();
        List<Account> accountObjectListBatch1=[select Id,Name,Status__c from Account];
        Integer count=0;
        for(Account obj:accountObjectListBatch1){
            if(obj.Status__c==true){
                count++;
            }
        }
        System.assertEquals(20,count);
    }
}