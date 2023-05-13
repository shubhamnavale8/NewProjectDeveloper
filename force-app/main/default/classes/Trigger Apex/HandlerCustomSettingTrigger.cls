public class HandlerCustomSettingTrigger {
    public static Boolean CustomSettingMethod(List<Bike__c> bikeObjectList){
        Boolean check=false;
        Map<String,CustomSteengTwoObject__c> myMap = CustomSteengTwoObject__c.getAll();
    	for(Bike__c bikeObject: bikeObjectList){
        	if(myMap.get('FirstRecord').Active__c==true){
        		check=true;
        	}
            if(check==true){
            	bikeObject.addError('You can\'t have sufficient permissions');
        	}
    	} 
        return check;
    }
}