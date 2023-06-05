@isTest
public class LeadTriggerTaskTest {
    @isTest
    public static void pritendEmailDuplicationLeadInsert(){
        List<Contact> contLst=LeadTestDataFactory.insertContact();
        Database.insert(contLst);
        List<Lead> leadLst=LeadTestDataFactory.insertLead();
        Database.SaveResult[] saveResult=Database.insert(leadLst,false);
        String result;
        for(Database.SaveResult res:saveResult){
           
            if (!res.isSuccess()) {
                for(Database.Error err : res.getErrors()) { 
                    System.debug('---------------'+err.getMessage());
                    result=err.getMessage();
                }
            }
        }
        Map<String,Contact> mapContact=new  Map<String,Contact>();
        for(Contact con:contLst){
            mapContact.put(con.Email,con);
        }
        List<Lead> resultLead=[SELECT Id from Lead Where FirstName=:mapContact.values().FirstName];
        System.assertEquals(true,Label.LeadEmailError.contains(result));
        System.assertEquals(0, resultLead.size());

    }
}