@isTest
public  class NewSobjectExceptionTaskOnInsertTest {
    @isTest
    public static void insertMethodTest(){
        String result=NewSobjectExceptionTaskOnInsert.insertMethod();
        System.assertEquals(true, result.contains('Insert failed'));
    }
    @isTest
    public static void test200QueryMethodTest(){
        // List<Account> result=NewSobjectExceptionTaskOnInsert.test200QueryMethod();
        // System.assertEquals(200, result.size());
    }
    @isTest
    public static void heapSizeCheckMethodTest(){
        Integer result=Limits.getHeapSize();
        NewSobjectExceptionTaskOnInsert.heapSizeCheckMethod();
        System.assert(result< Limits.getHeapSize());
       
    }
    @isTest
    public static void cpuTimeCheckMethodTest(){
        NewSobjectExceptionTaskOnInsert.cpuTimeCheckMethod();
        Integer result=Limits.getCpuTime();
        System.assert(10000<result);
    }
    @isTest
    public static void codeRefactorTaskTest(){
        Contact objContact=new Contact(LastName='Test');
        insert objContact;
        NewSobjectExceptionTaskOnInsert.codeRefactorTask();
        List<Contact> objContactNew=[SELECT Id,LastName from Contact WHERE LastName=:objContact.LastName];
        Map<Id,Contact> objMap=new Map<Id,Contact>(objContactNew);
        List<Task> lstTask=[SELECT Id,WhoId FROM Task WHERE WhoId IN :objMap.keySet()];
        System.assert(lstTask.size()>0);
    }
    
}