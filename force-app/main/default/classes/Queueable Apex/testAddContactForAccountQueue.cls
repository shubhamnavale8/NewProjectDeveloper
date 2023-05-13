@isTest
public class testAddContactForAccountQueue {
	@isTest 
    static void TestList(){
         List<Account> Teste = new List <Account>();
         for(Integer i=0;i<100;i++){
             Teste.add(new Account(name = 'Test'+i));
         }
         insert Teste;
         Contact co = new Contact();
         co.FirstName='demo';
         co.LastName ='demo';
         insert co; 
         AddContactForAccountQueue apc = new AddContactForAccountQueue(co);
         Test.startTest();
         System.enqueueJob(apc);
         Test.stopTest();
		 System.assertEquals(100, [select count() from Contact where accountID IN (SELECT id FROM Account)]);
      }
}