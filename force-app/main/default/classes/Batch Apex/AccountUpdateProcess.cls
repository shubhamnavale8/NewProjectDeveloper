global class AccountUpdateProcess implements Database.Batchable<SObject>{
    global Integer count=0;
    global static Integer countInstall=0;
    global Database.QueryLocator start(Database.BatchableContext bc){ 
        return Database.getQueryLocator('SELECT Id, Name, Phone, Status__c,Type FROM Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> records){
        List<Account> accountObjectList=new List<Account>();
        for(Account accountObject:records){
            accountObject.Phone='12345678'+count++;
            accountObject.Status__c=true;
            accountObjectList.add(accountObject);
            if(accountObject.Type=='Installation Partner'){
                countInstall++;
            }
        }
        Database.update(accountObjectList,false);
    }
    global void finish(Database.BatchableContext bc){
        System.debug('Account Installation Partner Count :='+countInstall);
    }
}