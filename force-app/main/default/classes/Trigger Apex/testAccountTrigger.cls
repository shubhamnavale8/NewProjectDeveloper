@isTest
public class testAccountTrigger {
    
    @isTest
    public static void testbillingToShippingMethod(){
        List<Account> listAccount=new List<Account>();
        
        for(Integer integgerVar=0; integgerVar<25; integgerVar++){
            Account accountObject=new Account();
            accountObject.name='IDBI Bank_Test'+integgerVar;
            accountObject.BillingCity='Aurangabad_test'+integgerVar;
            accountObject.BillingCity='India_test'+integgerVar;
            accountObject.BillingPostalCode='431136'+integgerVar;
            accountObject.BillingState='Maharashtra_test'+integgerVar;
            accountObject.BillingStreet='chakan road_test'+integgerVar;
            listAccount.add(accountObject);
        }
        Database.insert(listAccount,false);
        //insert accountObject;
        Integer i=0;
        List<Account> forAccountObject=[select BillingCity,ShippingCity,ShippingPostalCode,BillingPostalCode from Account ];
        for(Account result:forAccountObject){
            System.assertEquals(result.ShippingCity, result.BillingCity,'Test Case is Pass 1.'+(i++));
            System.assertEquals(result.ShippingPostalCode, result.BillingPostalCode,'Test Case is Pass 2.'+(i++));
        }
    }
    @isTest
    public static void testchangeFieldMethodOnetoAnother(){
        List<Account> listAccount=new List<Account>();
        for(Integer integgerVar=0 ;integgerVar<25; integgerVar++){
            Account accountObject=new Account();
            accountObject.name='IDBI Bank_Test'+integgerVar;
            accountObject.BillingCity='Aurangabad_test'+integgerVar;
            accountObject.BillingCity='India_test'+integgerVar;
            accountObject.BillingPostalCode='431136'+integgerVar;
            accountObject.BillingState='Maharashtra_test'+integgerVar;
            accountObject.BillingStreet='chakan road_test'+integgerVar;
            accountObject.Industry='Engineering';
            listAccount.add(accountObject);
        }
        Database.insert(listAccount,false);
        List<Account> listAccount2=[select Id,Industry,Active__c from Account ];
        List<Account> listAccount3=new  List<Account>();
        for(Account accountObjectForItr:listAccount2 ){
            accountObjectForItr.Industry='Finance';
            listAccount3.add(accountObjectForItr);
        }
        Database.update(listAccount3,false);
        List<Account> resultListAccount=[select Id,Industry,Active__c from Account ];
        for(Account result:resultListAccount){
            System.assertEquals(true,result.Active__c);
        }

    }
    @isTest
    public static void testpriventFromDeletMethod(){
        List<Account> listAccount=new List<Account>();
        
        for(Integer integgerVar=0; integgerVar<20; integgerVar++){
            Account accountObject=new Account();
            
            accountObject.BillingCity='Aurangabad_test'+integgerVar;
            accountObject.BillingCity='India_test'+integgerVar;
            accountObject.BillingPostalCode='431136'+integgerVar;
            accountObject.BillingState='Maharashtra_test'+integgerVar;
            accountObject.BillingStreet='chakan road_test'+integgerVar;
            if(integgerVar<10){
                if(integgerVar<5){
                    accountObject.name='ForActiveWithOpp'+integgerVar;
                    accountObject.Active__c=true;
                }
                else {
                    accountObject.name='ForActiveWithOutOpp'+integgerVar;
                    accountObject.Active__c=true;
                }
            }
            else{
                if(integgerVar<15){
                    accountObject.Active__c=false;
                    accountObject.name='ForDeActiveWithOpp'+integgerVar;
                }
                else{
                    accountObject.Active__c=false;
                    accountObject.name='ForDeActiveOnly'+integgerVar;
                }
            }
            listAccount.add(accountObject);
        }
        Database.insert(listAccount,false);
        List<Account> withOppAndActive=[select Id from Account where Name Like 'ForActiveWithOpp%'];
        List<Account> withoutOpp=[select Id from Account where Name Like 'ForActiveWithOutOpp%'];
        List<Account> deActiveWithOpp=[select Id from Account where Name Like 'ForDeActiveWithOpp%'];
        List<Account> deActiveOnly=[select Id from Account where Name Like 'ForDeActiveOnly%'];    
        for(Account accountObject:withOppAndActive ){
            Opportunity oppObject=new Opportunity();
            oppObject.Amount=400000;
            oppObject.StageName='Closed Won';
            oppObject.CloseDate=date.today();
            oppObject.Name='For Test';
            oppObject.AccountId=accountObject.Id;
            insert oppObject;
        }
        for(Account accountObject1:deActiveWithOpp){
            Opportunity oppObject=new Opportunity();
            oppObject.Amount=400000;
            oppObject.StageName='Closed Won';
            oppObject.CloseDate=date.today();
            oppObject.Name='For Test';
            oppObject.AccountId=accountObject1.Id;
            Database.insert(oppObject,false);
        }
        List<Account> withOppAndActiveCheck=[select Id,Name,Active__c from Account where Name Like 'ForActiveWithOpp%'];
        Database.delete(withOppAndActiveCheck,false);
        List<Account> withOppAndActiveCheck1=[select Id,Name,Active__c from Account where Name Like 'ForActiveWithOpp%'];
        System.assertEquals(5, withOppAndActiveCheck1.size());

        List<Account> withoutOppCheck=[select Id,Name,Active__c from Account where Name Like 'ForActiveWithOutOpp%'];
        Database.delete(withoutOppCheck,false);
        List<Account> withoutOppCheck1=[select Id,Name,Active__c from Account where Name Like 'ForActiveWithOutOpp%'];
        System.assertEquals(5, withoutOppCheck1.size());

        List<Account> deActiveWithOppCheck=[select Id,Name,Active__c from Account where Name Like 'ForDeActiveWithOpp%'];
        Database.delete(deActiveWithOppCheck,false);
        List<Account> deActiveWithOppCheck1=[select Id,Name,Active__c,(select Id, AccountId from Opportunities) from Account where Name Like 'ForDeActiveWithOpp%'];
        System.assertEquals(5, deActiveWithOppCheck1.size());

        List<Account> deActiveOnlyCheck=[select Id,Name,Active__c from Account where Name Like 'ForDeActiveOnly%'];
        Database.delete(deActiveOnlyCheck,true);
        List<Account> deActiveOnlyCheck1=[select Id,Name,Active__c ,(select Id, AccountId from Opportunities) from Account where Name Like 'ForDeActiveOnly%'];
        System.assertEquals(0, deActiveOnlyCheck1.size());

    }
    @isTest
    public static void testtaskCreatedForActivityMethod(){
        List<Account> accountObjectForTask=new List<Account> ();
        for(Integer loopVariable=0; loopVariable<20; loopVariable++){
            Account accountObject=new Account(Name='Test_'+loopVariable,AnnualRevenue=70000+loopVariable);
            accountObjectForTask.add(accountObject);
        }
        
        Database.insert(accountObjectForTask);
        List<Task> taskObject=[select Id from Task];
        System.assertEquals(accountObjectForTask.size(), taskObject.size());
    }
    @isTest
    public static void testphoneOfAccountUpdateWithContactMethod(){
        List<Account> listAccount=new List<Account>();
        
        for(Integer integgerVar=0; integgerVar<25; integgerVar++){
            Account accountObject=new Account();
            
            accountObject.name='IDBI Bank_Test'+integgerVar;
            accountObject.BillingCity='Aurangabad_test'+integgerVar;
            accountObject.BillingCity='India_test'+integgerVar;
            accountObject.Phone='830877526'+integgerVar;
            accountObject.Active__c=true;
            listAccount.add(accountObject);
        }
        Database.insert(listAccount);
        List<Account> listAccount1=[select Id,Name,Phone from Account ];
        Integer integgerVar=0;
        List<Contact> contactNew=new List<Contact>();
        for(Account accountForContact : listAccount1){
            Contact contactObject=new Contact();
            contactObject.LastName='LastName_Test'+integgerVar++;
            contactObject.AccountId=accountForContact.Id;
            contactNew.add(contactObject);
        }
        Database.insert(contactNew);
        List<Account> oldAccountListForResult=[select Id,Name,Phone from Account ];
        System.debug('oldAccountListForResult'+oldAccountListForResult);
        List<Account> oldAccountList=[select Id,Name,Phone from Account ];
        System.debug('oldAccountList'+oldAccountList);
        List<Account> newAccountList=new List<Account>();

        for(Account accountObjectFor: oldAccountList){
            accountObjectFor.Phone=accountObjectFor.Phone+2;
            newAccountList.add(accountObjectFor);
            //update accountObjectFor;
        }
        Database.update(newAccountList);
        
        List<Account> newAccountList1=[select Id,Name,Phone from Account];
        for(Account accountObject: newAccountList1){
            List<Contact> contactObject=[select Id,Phone,AccountId from Contact WHERE AccountId=:accountObject.Id];
            for(Account olaAccnt: oldAccountListForResult){
                 if(accountObject.Phone!=olaAccnt.Phone){
                    for(Contact c : contactObject){
                        System.assertEquals(accountObject.Phone,c.Phone );  
                    }
                 }
            }
        }
    }
    @isTest
    public static void testsendMailforDeletedAccountMethod(){
        Account accountObject=new Account(Name='farmHouse');
        insert accountObject;
        Integer i=0;
        List<Account> listAccount=[select Id , Name from Account];
        for(Account objectList : listAccount){
            Contact contactObject=new Contact();
            contactObject.LastName='Shubham Navale'+(i++);
            contactObject.Email='shubham.navale8@gmail.com';
            contactObject.AccountId=objectList.Id;
            insert contactObject;
        }

        List<Account> deletAccount=[select Id,Name from Account];
        Database.delete(deletAccount);
    }
    
}