global class CampaignStatusUpdateProcess implements Database.Batchable<SObject>{
    global static Integer count=0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Status from Campaign');
    }
    global void execute(Database.BatchableContext bc, List<Campaign> records){
        List<Campaign> campaignList=new List<Campaign>();
        for(Campaign campObject:records){
            if(campObject.Status=='Aborted'){
                campObject.Status='Completed';
                campaignList.add(campObject);
                count++;
            }  
        }
        Database.update(campaignList);
    }
    global void finish(Database.BatchableContext bc){
        System.debug('Number Of Campaign updated := '+count);
    }
}