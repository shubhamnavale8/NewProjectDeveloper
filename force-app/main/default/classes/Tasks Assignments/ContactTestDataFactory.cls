@isTest
public class ContactTestDataFactory {
    public static List<Contact> insertContact(Integer intVal){
        List<Contact> contactLst=new List<Contact>();
        for(Integer itr=0; itr<intVal; itr++){
            Contact contactObject=new Contact();
            contactObject.FirstName='Test_FirstName_'+itr;
            contactObject.LastName='Test_LastName_'+itr;
            contactLst.add(contactObject);
        }
        return contactLst;
    }
}