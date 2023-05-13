@isTest
public class testCustomSettingTrigger {
	@isTest
    public static void testMethodForBike(){
        List<Bike__c> bikeList=new List<Bike__c>();
        //try{
            	Bike__c bikeObject=new Bike__c();
            	bikeObject.Name='Pulser 220';
            	bikeObject.bike_id__c=111;
                bikeObject.Bike_owner__c='shubham';
                bikeList.add(bikeObject);
        Database.insert(bikeList);
        //}
        //catch(DMLException ex){
           // System.assertEquals(true,ex.getMessage().contains('You can\'t have sufficient permissions'));
        //}
        
    }
}