public with sharing class ForDatabaseClass {
    public ForDatabaseClass() {

    }

    public void ForDatabaseClass(){
        List<Account> accountObject=new List<Account>();

        for(Integer itr=0; itr<10; itr++){
            accountObject.add(new Account(Name='Acoount for Test_'+itr));
        }
        accountObject.add(new Account());
        System.debug(accountObject.size());

        Database.saveResult[] saveList=Database.insert(accountObject,false);

        for(Database.SaveResult s: saveList){
            if(s.isSuccess()){
                System.debug('This is Sucessfully done : '+s.getId());
            }
            else {
                System.debug('This is Unsuccessful because of Following error  ');
                for(Database.Error e: s.getErrors()){
                    System.debug(e.getStatusCode()+' '+e.getMessage());
                    System.debug('Field affected by insertion are : '+e.getFields() );
                }
            }
        }
    }
}