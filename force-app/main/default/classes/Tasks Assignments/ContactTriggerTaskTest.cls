@isTest
public class ContactTriggerTaskTest {
    @isTest
    public static void testMethodForContact(){

        List<Contact> lstContact=ContactTestDataFactory.insertContact(40);
        Map<String,Contact> mapObjectLst=new Map<String,Contact>();
        Database.insert(lstContact);
        for(Contact objContact:lstContact){
            mapObjectLst.put(objContact.FirstName,objContact);
        }
        List<Contact> lstContactResult = [SELECT Id, FirstName, LastName From Contact WHERE FirstName IN :mapObjectLst.keySet()];
        System.assertEquals(lstContact.size()*2, lstContactResult.size());
        
        System.assertNotEquals(lstContact.size(), lstContactResult.size());

    }
}