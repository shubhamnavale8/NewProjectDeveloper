trigger AuthorTask2Trigger on Author__c (before insert) {
	if(Trigger.isBefore && Trigger.isInsert && AuthorTaskTriggerHandler.customSettingActiveMethod()!=true){
		System.debug('3rd Trigger ');
		AuthorTaskTriggerHandler.skypeMailId(Trigger.new);	
	}	
}