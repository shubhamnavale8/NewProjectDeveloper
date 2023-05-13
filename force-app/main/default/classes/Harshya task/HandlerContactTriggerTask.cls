public class HandlerContactTriggerTask {
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
}