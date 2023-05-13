@isTest
public class testAsyncAssignmentFirst {
    @testSetup
    public static void testSetUpMethod(){
        for(Integer i=0; i<2; i++){
            Account accountObject=new Account(Name='Enzigma_Test_'+i);
            insert accountObject;
        }
        for(Integer j=0; j<10; j++){
            if(j<5){
                Account accObj=[select Id,Name from Account where Name='Enzigma_Test_0'];
                Contact contObj=new Contact(LastName='shubham_'+j, AccountId=accObj.Id);
                insert contObj;
            }
            else{
                Account accObj=[select Id,Name from Account where Name='Enzigma_Test_1'];
                Contact contObj=new Contact(LastName='Navale_test'+j, AccountId=accObj.Id);
                insert contObj;
            }
        }
    }
    @isTest
     public static void testuserAndAccountMethod(){
        Test.startTest();
        AsyncAssignmentFirst.userAndAccountMethod();     
        Test.stopTest();
    }
	@isTest
    public static void countContactsTest(){
        List<Account> accountId=[select Id from Account];
        List<Id> listOfId=new List<Id>();
        
        for(Account obj:accountId){
            listOfId.add(obj.Id);
        }
        Test.startTest();
        AsyncAssignmentFirst.countContacts(listOfId);
        Test.stopTest();
        Account accountObj=[select Id,Name, Number_Of_Contacts__c from Account where Name='Enzigma_Test_0'];
        Integer countOfContactFirst=[select count() from Contact where Name Like 'shubham_%'];
        Account accountObj1=[select Id,Name, Number_Of_Contacts__c from Account where Name='Enzigma_Test_1'];
        Integer countOfContactSecond=[select count() from Contact where Name Like 'Navale_test%'];
        System.debug(accountObj);
        System.debug(accountObj1);
        System.assertEquals(countOfContactFirst,accountObj.Number_Of_Contacts__c );
        System.assertEquals(countOfContactSecond,accountObj1.Number_Of_Contacts__c );
    }
}