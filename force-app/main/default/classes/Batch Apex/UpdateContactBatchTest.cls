@isTest
public class UpdateContactBatchTest {
    @isTest
    public static void testMethodForBatch(){
        List<Contact> contactObjectList=new List<Contact>();
        for(Integer contactItr=0; contactItr<50; contactItr++){
            Contact contactObject=new Contact();
            contactObject.LastName='Test_'+contactItr;
            contactObjectList.add(contactObject);
        }
        Database.insert(contactObjectList,false);
        
        Test.startTest();
        UpdateContactBatch batchObject=new UpdateContactBatch();
        Database.executeBatch(batchObject);
        Test.stopTest();
        
        List<Contact> checkObject=[SELECT Id, Email,Phone,LastName from Contact where LastName Like 'Test_%'];
        for(Contact count:checkObject){
            System.assertEquals('test@enzigma.com', count.Email);
            System.assertEquals('123456789', count.Phone);
        }
    }
}