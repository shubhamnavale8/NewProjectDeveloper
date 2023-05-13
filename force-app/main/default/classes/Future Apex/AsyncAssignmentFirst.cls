public class AsyncAssignmentFirst {
    @future
    public static void userAndAccountMethod(){
        
            User userObject=new User(FirstName='Jack',LastName='Sparrow',Alias='jacky',Email='jackSparrow@gmail.com',Username='jackSparrow1234@gmail.com',CommunityNickname='jackMainOrg',TimeZoneSidKey='Asia/Kolkata', LocaleSidKey='en_IN', EmailEncodingKey='UTF-8', ProfileId='00e2w000005ARKXAA4', LanguageLocaleKey='en_US');
            insert userObject;
            Account accountObject=new Account(Name='Async_Account_Created');
            insert accountObject;
    
    }
    @future
    public static void countContacts(List<Id> accountObjectList){
       
            if(System.isFuture()){
                for(Id obj : accountObjectList){
                    Account accountObject=[select Id,Number_Of_Contacts__c  from Account where Id=:obj];
                    List<Contact> contactObject=[select Id , AccountId From Contact where AccountId=:obj];
                    accountObject.Number_Of_Contacts__c=(Integer)contactObject.size(); 
                    update accountObject;
                    /*
                    --AsyncAssignmentFirst.userAndAccountMethod();
                    --System.AsyncException: Future method cannot be called from a future or batch method: AsyncAssignmentFirst.userAndAccountMethod()  

                    --You can't call another future method from a future method. As per Salesforce documentation,
                    --You can't call a method annotated with the future from a method that also has the future annotation. Nor can you call a trigger from 
                    --an annotated method that calls another annotated method.  
                    */
                } 
            }
            else{
                //AsyncAssignmentFirst.userAndAccountMethod();
            }  
    }
    
}