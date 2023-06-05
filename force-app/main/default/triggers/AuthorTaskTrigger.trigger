trigger AuthorTaskTrigger on Author__c (before insert) {	
	if(Trigger.isBefore && Trigger.isInsert){
		System.debug('1st Trigger ');
		AuthorTaskTriggerHandler.gmailMailId(Trigger.new);
	}
}