@isTest
public  class testLeadBatchAccountBatchQFour {
    @isTest
    public static void testForLeadAndAccountBatch(){
        List<Account> accountObjectList=new List<Account>();
        for(Integer accountItr=0; accountItr<20; accountItr++){
            
            if(accountItr<10){
                Account accountObject=new Account();
                accountObject.Name='Shubham_test_'+accountItr;
                accountObject.Status__c=false;
                accountObject.Type='Installation Partner';
                accountObjectList.add(accountObject);
            }
            else{
                Account accountObject=new Account();
                accountObject.Name='Shubham_test_'+accountItr;
                accountObject.Status__c=false;
                accountObjectList.add(accountObject);
            }
            
        }
        Database.insert(accountObjectList,false);
        //List<Account> accountObjectListBatch=[select Id,Name,Status__c from Account];

        //--------------------------------------------------------------
		
        List<Lead> leadObjectList=new List<Lead>();
        for(Integer leaditr=0; leaditr<50; leaditr++){
            Lead leadObject=new Lead(LastName='Test_Lead_'+leaditr,Company='Test_Company_Lead_'+leaditr ,Status='Closed - Converted');
            leadObjectList.add(leadObject);
        }
         insert leadObjectList;
        Test.startTest();
        LeadDeleteProcess leadObjectBatch=new LeadDeleteProcess();
        Database.executeBatch(leadObjectBatch);
        Test.stopTest();
        //-----------------------------------------------------------------------------------
        List<Account> accountObjectListBatch1=[select Id,Name,Status__c,Type from Account];
        Integer countOfAccountOfStatus=0;
        Integer countOfAccountType=0;
        for(Account obj:accountObjectListBatch1){
            if(obj.Type=='Installation Partner' && obj.Status__c==true ){
                countOfAccountType++;
                countOfAccountOfStatus++;
            }
            else if(obj.Status__c==true){
                countOfAccountOfStatus++;
            }
        }
        System.assertEquals(20,countOfAccountOfStatus);
        System.assertEquals(10, countOfAccountType);
    
    }
}