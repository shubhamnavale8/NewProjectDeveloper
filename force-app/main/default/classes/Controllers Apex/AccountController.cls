public class AccountController {
    public String accountId{get;set;}
    public Account actObj{get;set;}
    public AccountController() {
        actObj = new Account();
    }  
    @AuraEnabled(cacheable=true)    
    public static List<Account> getAccounts(){
        return [select id,name,type,phone,industry from Account limit 10];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecordsList(String industryObject){
        //System.debug('0000000000000000000000-----------------000000000000'+industryObject);
        return [select id,name,type,phone,industry from Account where industry=:industryObject ];
    }
    public pageReference retrieveAccountDetail(){
        if(accountId!=null){
             actObj = [select id,name,type,industry from Account where id=:accountId];  
        }       
		return null;        
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecordsByName(String accountNames){
        String str='%'+accountNames+'%';
        System.debug('---------------------------str : '+accountNames);
        return [select id,name,type,phone,industry from Account where Name LIKE :str];
    }
}