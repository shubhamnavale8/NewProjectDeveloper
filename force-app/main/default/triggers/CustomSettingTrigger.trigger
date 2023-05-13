trigger CustomSettingTrigger on Bike__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert && HandlerCustomSettingTrigger.CustomSettingMethod(Trigger.new)){
    	
    }
}