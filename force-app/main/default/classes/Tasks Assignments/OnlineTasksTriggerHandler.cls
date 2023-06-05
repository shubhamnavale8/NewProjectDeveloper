public class OnlineTasksTriggerHandler {
    //Question:-
    //Write a trigger on Account when Account is update check all opportunity inside the account.
    // Update all Opportunities Stage to close lost if an opportunity created date is greater than
    // 30 days from today and stage not equal to close won.
    public static void accountOppertunityUpdate(Map<Id,Account> oppMap){
        List<Opportunity> oppList=[Select Id,AccountId, StageName,CreatedDate,Name from Opportunity where AccountId IN :oppMap.keySet()];
        Date myDate=date.today().addDays(30);
        List<Opportunity> oppLst=new List<Opportunity>();
        for(Opportunity oppObject:oppList){
            if(oppObject.StageName!='Closed Won' && oppObject.CreatedDate < myDate){
                oppObject.StageName='Closed Lost';
                oppLst.add(oppObject);
            }
        }
        Database.update(oppLst);
    }

}