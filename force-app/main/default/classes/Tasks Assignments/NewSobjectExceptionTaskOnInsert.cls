public class NewSobjectExceptionTaskOnInsert {
    public static String insertMethod(){
        String result=' ';
        try{
            for(Integer itr=0; itr<200; itr++){
                Account accObject=new Account();
                accObject.Name='Test Account For Task '+itr;
                insert accObject;
            }    
        }
        catch(Exception ex){
            result='Record Cants Inserts '+ex.getMessage();
            System.debug('Record Cants Inserts '+ex.getMessage());
            return result;
        }
        return result;
    }
    public static List<Account> test200QueryMethod(){

        List<Account> records = new List<Account>();
        Integer batchSize = 200;
        Integer offset = 0;
        Boolean hasMoreRecords = true;
        while (hasMoreRecords) {
            
            String query = 'SELECT Id, Name FROM Account LIMIT ' + batchSize ;
            records = Database.query(query);
           
        }
        return records;
    }
    public static void heapSizeCheckMethod(){
        try{
            List<Account> accLst=new List<Account> ();
        //System.debug('Heap Size-----------------------++'+LIMITS.getHeapSize());
        //18:33:44:239 USER_DEBUG [26]|DEBUG|Heap Size-----------------------++1113
        accLst=[Select FIELDS(STANDARD) from Account];
            //System.debug('Heap Size-----------------------++'+LIMITS.getHeapSize());
        //18:31:43:272 USER_DEBUG [30]|DEBUG|Heap Size-----------------------++40565
        }
        catch(Exception ex){

        }
        
    }

    public static void cpuTimeCheckMethod(){
        try{
            while (1==1) {
                System.debug('While iS executing');
            }

        }catch(LimitException ex){

        }
        
        // Maximum CPU time: 15061 out of 10000 ******* CLOSE TO LIMIT
    }
    public static void codeRefactorTask(){
        //How to refractor below code?
        // Task taskObject;
        // for (Contact contactObject : [SELECT Id, AccountId, LastName FROM Contact]){
        //     taskObject = new Task(WhoId = contactObject.Id);
        //     insert taskObject;
        // }

        List<Task> taskLst=new List<Task>();
        List<Contact> contactLst=[SELECT Id, AccountId, LastName FROM Contact];
        for(Contact contObject:contactLst){
            Task taskObject=new Task();
            taskObject = new Task(WhoId = contObject.Id);
            taskLst.add(taskObject);
        }
        Database.insert(taskLst);
    }
}



//NewSobjectExceptionTaskOnInsert.test200QueryMethod();
//NewSobjectExceptionTaskOnInsert.cpuTimeCheckMethod();
//NewSobjectExceptionTaskOnInsert.heapSizeCheckMethod();