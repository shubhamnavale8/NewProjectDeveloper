public class HandlerForCustomSettingTrigger {
    public static void checkforCustomSetting(List<Bike__c> bikeObjectList){
        
        for(Bike__c bikeObject:bikeObjectList){
            try{
                CustomSettingObjects__c custObject=[select Id, ActiveCustomSetting__c, CreatedById from CustomSettingObjects__c where CreatedById=:bikeObject.OwnerId];
            	if(custObject.ActiveCustomSetting__c!=true){
                	bikeObject.Id.addError('From Trigger Custom Setting Error');
            	}
            }
            catch(Exception ex){
                bikeObject.Id.addError('From Trigger Custom Setting Error');
            }
        }
    }
}