@isTest
public with sharing class NewSobjectExceptionTaskOnInsertTest {
    @isTest
    public static void testMethodForInsert(){
        NewSobjectExceptionTaskOnInsert.insertMethod();
        List<Account> accLst=[Select Id,Name from Account Where Name Like 'Test Account For Task %'];
        System.assertEquals(200, accLst.size());
        System.assertNotEquals(150, accLst.size());
    }    
}