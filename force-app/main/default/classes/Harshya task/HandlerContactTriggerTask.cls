public class HandlerContactTriggerTask {
    public static Integer count=0;
    public static void forCheckPhoneEmailMethod(List<Contact> contactList){
        /*for(Contact contactObject:contactList){
            if(contactObject.Phone!=null && contactObject.Email.endsWithIgnoreCase('@enzigma.com')){
                contactObject.Active__c=true;
            }
            else{
                contactObject.Active__c=false;
            }
            QueueableTask queueObject=new QueueableTask(contactObject.AccountId);
            System.enqueueJob(queueObject);
        }*/
    }
    public static void forMethodForDeleteUndelete(List<Contact> contactList){
        /*for(Contact contactObject:contactList){
            if(contactObject.Active__c==true){
                QueueableTask queueObject=new QueueableTask(contactObject.AccountId);
                System.enqueueJob(queueObject);
            }
        }*/
    }
    public static void createContactTaskAssignment(List<Contact> lstContact){
       // try{
            List<Contact> newRecords=new List<Contact>();
            if(count<1){
                ++count;
                for(Contact objContact:lstContact){
                    Contact newContact=objContact.clone();
                    //newContact.Id=null;
                    newRecords.add(newContact);
                }
            }
            Database.insert(newRecords);
        // }catch(DmlException ex){
        //     System.debug('DMl Exception Occur : '+ex.getMessage());
        // }    
       
    }
}