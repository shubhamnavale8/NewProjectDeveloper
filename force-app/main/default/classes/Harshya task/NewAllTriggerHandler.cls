public class NewAllTriggerHandler {
	public static void changeFieldMethodOnetoAnother(List<Account> accountObjectNew,List<Account> accountObjectOld){
        Map<ID,Account> mapObject=new Map<Id,Account>();
        for(Account accountObject : accountObjectNew){
            if(accountObject.Industry=='Finance'){
                for(Account accountObject1 : accountObjectOld){
                    if((accountObject.Id==accountObject1.Id) && (accountObject1.Industry=='Engineering')){
                        accountObject.Active__C=true;
                    }
                }
            }
        }
    }
}