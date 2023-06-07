trigger PosititonTrigger on Position__c (before insert,after insert) {
	 if(Trigger.isBefore && Trigger.isInsert){
       PositionHandler.newPosition(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        PositionHandler.newTask(Trigger.newMap);
    }
}