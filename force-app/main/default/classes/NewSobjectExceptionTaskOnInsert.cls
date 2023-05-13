public with sharing class NewSobjectExceptionTaskOnInsert {
    public static void insertMethod(){
        try{
            List<Account> accLst=new List<Account>();
            for(Integer itr=0; itr<200; itr++){
                Account accObject=new Account();
                accObject.Name='Test Account For Task '+itr;
                accLst.add(accObject);
                insert accObject;
            }
            
        }
        catch(Exception ex){
            System.debug('Record Cants Inserts After 150 Opration'+ex.getMessage());
        }
    }
}

//NewSobjectExceptionTaskOnInsert.insertMethod();