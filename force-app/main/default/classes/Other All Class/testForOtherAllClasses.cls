@isTest
public with sharing class testForOtherAllClasses {
    @isTest
    public static void testContactAndLeadSearch(){
        String s='shubham';
        ContactAndLeadSearch.searchContactsAndLeads(s);
    }
    @isTest
    public static void testContactSearch(){
        ContactSearch.searchForContacts('navale','432123');
    }
    @isTest
    public static void testForDataBaseAssignment(){
        ForDataBaseAssignment obj = new ForDataBaseAssignment();
        obj.DatabaseInsertMethod();
        obj.DatabaseUpdateMethod();
        /*
        obj.DatabaseDeleteMethod();
        obj.DatabaseGetRecordMethod();
        obj.DatabaseGetClinicDataMethod();
         */
    }
    @isTest
    public static void testForDatabaseClass(){
        ForDatabaseClass obj=new ForDatabaseClass();
        obj.ForDatabaseClass();
    }

    @isTest
    public static void testForForExceptionCheck(){
        ForExceptionCheck obj=new ForExceptionCheck();
        obj.dmlExceptionMethod();
        obj.listExceptionMethod();
        obj.nullPointerExceptionMethod();
        obj.queryExceptionMethod();
        obj.genericExceptionMethod();
    }
    @isTest
    public static void testSOQLtestClassForCheck(){
        SOQLtestClassForCheck obj=new SOQLtestClassForCheck();
        obj.accountAndContactSOQLmethod();
    }
    @isTest
    public static void methodForPracticeclass(){
        ForPracticeClassDemo.methodPractice();
    }
}