@istest
public  class testLeadTrigger {
    @testSetup
    public static void setupMethod(){
        List<Lead> leadObjectList=new List<Lead>();
        for(Integer i=0; i<3; i++){
            Lead ObjectLead=new Lead(LastName='Navale'+i, Email='shubham.navale8@gmail.com'+1, Status='Open - Not Contacted', Company='Enzigma');
            leadObjectList.add(ObjectLead);
        }
        Database.insert(leadObjectList,true);
    }
    @isTest
    public static void forLeadCheck(){
        try{
            Lead leadObject=new Lead(LastName='Navale', Email='shubham.navale8@gmail.com'+1, Status='Open - Not Contacted', Company='Enzigma');
            insert leadObject;
        }
        catch(DmlException ex){
            System.assertEquals(true, ex.getMessage().contains('This Email is Already in use for lead'));
        }
        try{
            Lead leadObjectOne=new Lead(LastName='Navale'+1, Email='shubham.navale8@gmail.com', Status='Open - Not Contacted', Company='Enzigma');
            insert leadObjectOne;
        }
        catch(DmlException ex){
            System.assertEquals(true, ex.getMessage().contains('This Last Name is Already Exist '));
        }
        try{
            Lead leadObjectTwo=new Lead(LastName='Navale'+1, Email='shubham.navale8@gmail.com'+1, Status='Open - Not Contacted', Company='Enzigma');
            insert leadObjectTwo;
        }
        catch(DmlException ex){
            System.assertEquals(true, ex.getMessage().contains('This User is Already Exist'));
        }
        
    }
}