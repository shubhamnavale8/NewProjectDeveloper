public class AccountHandler {
	 Public static void RatingUpdate(List<Account>newAccount,Map<Id,Account>accountOldMap){
        for(Account account:newAccount){
            if((accountOldMap==null && account.Industry!=null && account.Industry=='Media')||
               (account.Industry!=accountOldMap.get(account.id).Industry)){
                account.Rating='Hot';
            }
        }      
    }
    Public static void OpportuinityCreate(Map<Id,Account>newAccount){
        List<Opportunity> addopportunity=new List<Opportunity>();  
        for(Account accountiterate:newAccount.values()){
           Opportunity oppInstance=new Opportunity();
            oppInstance.AccountId=accountiterate.Id;
            oppInstance.Name='Created through trigger';
            oppInstance.StageName='Prospecting';
            oppInstance.CloseDate=Date.newInstance(2024, 02, 20);
            addopportunity.add(oppInstance);
            }
        insert addopportunity;
       }
    Public static void DescriptionUpdate(Map<Id,Account>newMap,Map<Id,Account>oldMap){      
       for(Account account:newMap.values()){
            if(account.Phone!=OldMap.get(account.id).Phone){
              account.Description='Phone is Updated from  '+OldMap.get(account.id).Phone +' to '+account.Phone;  
            }
        }      
    }   
}