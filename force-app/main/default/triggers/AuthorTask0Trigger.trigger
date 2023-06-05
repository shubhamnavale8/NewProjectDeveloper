trigger AuthorTask0Trigger on Author__c (before insert) {
    System.debug('0th Trigger');
}