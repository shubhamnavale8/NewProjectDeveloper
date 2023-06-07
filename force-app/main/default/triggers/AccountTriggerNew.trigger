trigger AccountTriggerNew on Account (before insert,after insert,before update) {
	 if(Trigger.isBefore && Trigger.isInsert){
        AccountHandler.RatingUpdate(Trigger.new,null);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountHandler.RatingUpdate(Trigger.new,Trigger.OldMap);
    } 
    if(Trigger.isAfter && Trigger.isInsert){
        AccountHandler.OpportuinityCreate(Trigger.newMap);
    }
    if(Trigger.isUpdate && Trigger.isBefore ){
        AccountHandler.DescriptionUpdate(Trigger.newMap,Trigger.oldMap);
    }
}