public with sharing class ForDataBaseAssignment {
    
    public void DatabaseInsertMethod(){
       /* List<Book_Details__c> bookObject=new List<Book_Details__c>();
        Date myDate1 = date.newinstance(1960, 1, 1);
        Date myDate2 = date.newinstance(1966, 1, 1);
        bookObject.add(new Book_Details__c(Name='Salesforce',Date_Of_Publish__c=myDate2));
        bookObject.add(new Book_Details__C(Name='Java',Date_Of_Publish__c=myDate1));
        
        System.debug('----------------Database Assignment 1 Question-------------------- ');
        Database.SaveResult[] savebook=Database.insert(bookObject,false);
       
        for(Database.SaveResult s: savebook){
            if(s.isSuccess()){
                System.debug('Record iS insert Successfully : '+s.getId());
            }
            else{
                System.debug('Unsuccessful Record reson is following : ');
                for(Database.Error e: s.getErrors()){
                    System.debug(e.getStatusCode()+' '+e.getMessage());
                    System.debug('error on filed is :'+e.getFields());
                }
            }
        }*/

    }
    public void DatabaseUpdateMethod(){
       /* List<Author__c> bookObject=new List<Author__c>();
        Author__c authorDObject=[select ID,Name,Email__c from Author__c where Name='Shubham Navale' ];
        
        authorDObject.Email__c='Shubham.navale8@gmail.com';

        Author__c authorDObject1=[select ID,Name,Email__c from Author__c where Name='Pratik Alhat' ];
        authorDObject1.Email__c='pratikAlhat@gmail.com';
        bookObject.add(authorDObject);
        bookObject.add(authorDObject1);
        System.debug('----------------Database Assignment 2 Question-------------------- ');
        Database.SaveResult[] savelist=Database.update(bookObject,false);
        for(Database.SaveResult s: savelist){
            if(s.isSuccess()){
                System.debug('Record is Update Successfully : '+s.getId());
            }
            else{
                System.debug('Unsuccessful Record reson is following : ');
                for(Database.Error e: s.getErrors()){
                    System.debug(e.getStatusCode()+' '+e.getMessage());
                    System.debug('error on filed is :'+e.getFields());
                }
            }
        }
        */
    }
    /*
    public void DatabaseDeleteMethod(){
        System.debug('----------------Database Assignment 3 Question-------------------- ');
        List<Book_Details__c> bookObject=[select ID from Book_Details__c];
        try{
            Database.DeleteResult[] deleteList=Database.delete(bookObject,false);

            for(Database.DeleteResult d: deleteList){
                if(d.isSuccess()){
                    System.debug('Record is Delete Successfully : '+d.getId());
                }
                else{
                    System.debug('Unsuccessful Record reson is following : ');
                    for(Database.Error e: d.getErrors()){
                        System.debug(e.getStatusCode()+' '+e.getMessage());
                        System.debug('error on filed is :'+e.getFields());
                    }
                }
            }
        }
        catch(DmlException ex){
            System.debug('DML Exception Occur in deletion records : '+ex.getMessage());
        }
    }
    public void DatabaseGetRecordMethod(){
        System.debug('----------------Database Assignment 4 Question-------------------- ');
        string query = 'Select ID,Name from Book_Details__c';
        //system.debug(Database.getQueryLocator(query));
        Database.QueryLocator q = Database.getQueryLocator(query);
        Database.QueryLocatorIterator it =  q.iterator();

        while (it.hasNext()){
            Book_Details__c bookData = (Book_Details__c)it.next();
            System.debug(bookData);
        }
    }
    public void DatabaseGetClinicDataMethod(){
       
    } */
}