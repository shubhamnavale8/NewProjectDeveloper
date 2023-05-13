public with sharing class HandlerAccountTrigger {
    
    public static void billingToShippingMethod(List<Account> accountObject){
        for(Account a:accountObject){
            //a.ShippingAddress = a.BillingAddress;  
            a.ShippingCity = a.BillingCity;
            a.ShippingCountry = a.BillingCountry;
            a.ShippingPostalCode = a.BillingPostalCode;
            a.ShippingState = a.BillingState;
            a.ShippingStreet = a.BillingStreet;          
        }    
    }
    //----------------------------------------done-----------------------------------------
    public static void changeFieldMethodOnetoAnother(List<Account> accountObjectNew,Map<Id,Account>oldMap){
        for(Account account: accountObjectNew){
            if( account.Industry == 'Finance' && oldMap.get(account.Id).Industry=='Engineering'){
                account.Active__c=true;
                System.debug('Trigger fired');
            }
        }
    }
    //-----------------------------------------done------------------------------------------------------
    public static void priventFromDeletMethod(List<Account> listAccountObjectOld,Map<Id,Account> mapAccountsOld){
   		Set<Id> setAccountIds=mapAccountsOld.keySet();
		List<Opportunity> listOpportunities =[select Id from opportunity where AccountId =:setAccountIds];
        Map<Id,Opportunity> mapOpportunities=new Map<Id,Opportunity>(); 
        for(Opportunity opportunityObject:listOpportunities){
            mapOpportunities.put(opportunityObject.AccountId,opportunityObject);
        }
        for(Account accountObjectForDelete: listAccountObjectOld){         
              if(accountObjectForDelete.Active__c==true){
                 accountObjectForDelete.Active__c.addError('You cant delete a record because its in active state');
              }else if(mapOpportunities.get(accountObjectForDelete.Id)!=null  ){
                 accountObjectForDelete.Id.addError('You cant delete a record because Opportunity Records are associated with This Account ');
              }
         }
    }
    //---------------------------------------done-----------------------------------------------------
    public static void taskCreatedForActivityMethod(List<Account> accountObjectForNewRecord){
       List<Task> listTasks=new List<Task>();
        for(Account acoountObject: accountObjectForNewRecord){
            if(acoountObject.AnnualRevenue>50000){
                Date myDate1=date.newInstance(2023, 5, 5);
                Task newTaskCreate = new Task();
                newTaskCreate.Subject='Follow Up Test Task for Acoount : '+acoountObject.Name;
                newTaskCreate.WhatId=acoountObject.Id;
                newTaskCreate.ActivityDate=myDate1;
                newTaskCreate.Status='In Progress';
                listTasks.add(newTaskCreate);
            }      
        }
        insert listTasks;
    }
 //-------------------------------------------------done-----------------------------------------------------------   
    public static void phoneOfAccountUpdateWithContactMethod(Map<Id,Account> accountNewMap, Map<Id,Account> accountOldMap){
        List<Contact> listContacts = [Select id,FirstName,LastName,AccountId from contact];
        List<Contact> listContactsUpdate=new List<Contact>();
         for(Contact contacts : listContacts){
             Account newAccount = accountNewMap.get(contacts.AccountId);
             Account oldAccount = accountOldMap.get(contacts.AccountId); 
             if(newAccount != null && oldAccount != null){
                 if(((newAccount.Phone != '' && oldAccount.Phone !='') && (newAccount.Phone!=null && oldAccount.Phone!=null)) || ((newAccount.Phone != '' && newAccount.Phone!=null) && (oldAccount.Phone =='' || oldAccount.Phone==null))){
                     if(newAccount.Phone != oldAccount.Phone){
                        contacts.Phone = newAccount.Phone;
                 		contacts.OtherPhone = oldAccount.Phone;
                 		contacts.HomePhone = newAccount.Phone;
                        listContactsUpdate.add(contacts);
                     }
                 }        
             }
         }
        Database.update(listContactsUpdate);
    }
    //-------------------------------incompleted--------------------------------------
    public static void sendMailforDeletedAccountMethod(Map<Id,Account> accountMap){
        List<Contact> contactsList = [Select Id, AccountId, Email from Contact];
        List<Messaging.SingleEmailMessage> emails=new List<Messaging.SingleEmailMessage>();
        List<String> emailList=new List<String>();
        for(Contact iContact : contactsList){
            Account acc = accountMap.get(iContact.AccountId);
            if(acc != null){
                if(iContact.Email != null && iContact.Email != ''){
                    EmailMissionSpecialist newEmail = new EmailMissionSpecialist();
                    String subject = 'Account Deletion notification';
                    String body = 'Your contact related Account is been deleted';
                    newEmail.sendMail(iContact.Email, subject, body);
                }
            }    
        }
    }
}