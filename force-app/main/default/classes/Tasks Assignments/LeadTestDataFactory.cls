@isTest
public class LeadTestDataFactory {
    public static List<Lead> insertLead(){
        //SELECT FirstName, Id, LastName, Salutation, Company, Email, Status FROM Lead
        List<Lead> leadLst=new List<Lead>();
        for(Integer itr=0; itr<20; itr++){
            Lead leadInstance=new Lead();
            leadInstance.FirstName='test_FirstName'+itr;
            leadInstance.LastName='test_LastName'+itr;
            leadInstance.Salutation='Mr.';
            leadInstance.Company='Enzigma_Test_Company';
            leadInstance.Email='test@enzigma.com';
            leadInstance.Status='Open - Not Contacted';
            leadLst.add(leadInstance);
        }
        return leadLst;
    }

    public static List<Contact> insertContact(){
        List<Contact> contactLst=new List<Contact>();
        for(Integer itr=0; itr<20; itr++){
            Contact contactInstance =new Contact();
            contactInstance.LastName='Test_LastName'+itr;
            contactInstance.Email='test@enzigma.com';
            contactLst.add(contactInstance);
        }
        return contactLst;
    } 
}