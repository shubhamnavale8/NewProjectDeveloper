global class LeadDeleteProcess implements Database.Batchable<SObject>{
    global static Integer count=0;
    global static Integer countBatch=0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select Id,LastName,Status from Lead where Status=\'Closed - Converted\'');
    }
    global void execute(Database.BatchableContext bc, List<Lead> records){
        List<Lead> leadObjectList=new List<Lead>();
        
        for(Lead leadObject:records){
            if(leadObject.Status=='Closed - Converted'){
                leadObjectList.add(leadObject);
                count++;             
            }
        }
        
        Database.delete(leadObjectList,false);
			countBatch++;
       
    } 
    global void finish(Database.BatchableContext bc){
        System.debug('Count of Records :='+count);
        System.debug('Count of Batch :=' +countBatch);
        AccountUpdateProcess accountobject=new AccountUpdateProcess();
        Database.executeBatch(accountobject);
        
    }
}