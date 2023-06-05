trigger AuthorTask1Trigger on Author__c (before insert) {
	if(Trigger.isBefore && Trigger.isInsert){
		System.debug('2nd Trigger ');
		AuthorTaskTriggerHandler.enzigmaMailId(Trigger.new);
	}
}