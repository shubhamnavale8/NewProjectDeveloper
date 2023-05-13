public class ForExceptionCheck{
    
    public void dmlExceptionMethod(){
        try{
            Job_Shubham__c customObject=new Job_Shubham__c();
            insert customObject;
        }
        catch(DmlException ex){
            System.debug('Exception is Occure of DML Exception : '+ex.getMessage());
            
        }
    }
    public void listExceptionMethod(){
        try{
            List<Integer> listObjects=new List<Integer>();
            listObjects.add(1);
            listObjects.add(2);
            listObjects.add(3);
            listObjects.add(4); 
            listObjects.add(5);
            listObjects.add(6);
            listObjects.add(7);
            listObjects.add(8);

            for(Integer listItr=0; listItr<listObjects.size()+2; listItr++){
                System.debug(listObjects.get(listItr));
            }
        }
        catch(ListException lstEx){
            System.debug('Exception is Occure of List Exception : '+lstEx.getMessage());
        }

    }
    public void nullPointerExceptionMethod(){
        try{
            String name;
            Boolean flag=name.contains('shubham');
        }
        catch(NullPointerException nullEx){
            System.debug('Exception is Occure of Null Pointer Exception : '+nullEx.getMessage());
        }
    }
    public void queryExceptionMethod(){
        try{
            List<Contact> contactList=[select LastName from Contact WHERE LastName='Navale'];
            System.debug(contactList.size());

            Contact contactList1=[select LastName from Contact ];
        }
        catch(QueryException qurEx){
            System.debug('Exception is Occure of Query Exception : '+qurEx.getMessage());
        }
    }
    public void genericExceptionMethod(){
        try{
            throw new SelfCreatedException();
        }
        catch(SelfCreatedException exceptionObject){
            System.debug('Exception is Occure of Generic Exception : '+exceptionObject.getMessage());
        }
    }
}