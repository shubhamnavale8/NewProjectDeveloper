public class UpdateContactBatch implements Database.Batchable<SObject>,Database.Stateful {
    List<contact> updateContactList= new List<contact>();
    public database.QueryLocator Start(Database.BatchableContext context){
        return database.getQueryLocator([Select Id,Phone,Email From Contact Where Phone=null OR Email=null]);
    }
    public void execute(Database.BatchableContext context,List<Contact> listContact){
        List<Contact>forUpdateContactList=new List<Contact>();
        for(contact objContact:listContact){
            if(objContact.Email==null){
                objContact.Email='test@enzigma.com';
            }
            if(objContact.Phone==null){
                objContact.Phone='123456789';
            }
            forUpdateContactList.add(objContact);
        }
        if(forUpdateContactList.size()>0){
            update forUpdateContactList;
        }
        updateContactList.addAll(forUpdateContactList);
    }
    public void finish(Database.BatchableContext context){
        AsyncApexJob objApexJob = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                                   TotalJobItems, CreatedBy.Email
                                   FROM AsyncApexJob WHERE Id =:context.getJobId()];
        System.debug(updateContactList);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'harshwardhan.katore@enzigma.com'});
        mail.setSubject('Contacts Updated'+Datetime.now());
        mail.setPlainTextBody('Batch Process has completed');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}