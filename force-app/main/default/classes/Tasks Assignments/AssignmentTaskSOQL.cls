public with sharing class AssignmentTaskSOQL {
    public static void question_1_method(){
        List<Lead> leadLst=[SELECT Name,Company,Email,Status from Lead];
        System.debug('question_1 = '+leadLst);
    }
    public static void question_2_method(){
        List<Lead> leadLst=[SELECT Name,Company,Email,Status from Lead WHERE Status='Closed - Converted'];
        System.debug('question_2 = '+leadLst);
    }
    public static void question_3_method(){
        List<Lead> leadLst=[SELECT Name,Company,Email,Status from Lead WHERE Status In('Closed - Converted','Closed - Not Converted')];
        System.debug('question_3 = '+leadLst);
        
    }
    public static void question_4_method(){
        List<Opportunity> oppLst=[SELECT Id, Name, StageName, Amount FROM Opportunity WHERE  StageName!='Closed Won' AND StageName!='Closed Lost'];
        System.debug('question_4 = '+oppLst);
    }
    public static void question_5_method(){
        Book_Details__c bookLst=[SELECT Id,Name,Author__r.Name from Book_Details__c Where Author__r.Name Like 'Kavi%'];
        System.debug('question_5 = '+bookLst);
    }
    public static void question_6_method(){
        List<Account> accLst=[SELECT Id,Name,Balance__c from Account WHERE Balance__c>0 ];
        System.debug('question_6 = '+accLst);
    }
    public static void question_7_method(){
        List<Case> caseLst=[SELECT ID,CaseNumber,ContactEmail,Status,Priority FROM case where status IN('New','Closed') AND Priority='High'];
        System.debug('question_7 = '+caseLst);
    }
    public static void question_8_method(){
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email From Lead ORDER BY Name ASC];
        System.debug('question_8 = '+leadLst);
    }
    public static void question_9_method(){
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email From Lead ORDER BY Name DESC];
        System.debug('question_9 = '+leadLst);
    }
    public static void question_10_method(){
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email From Lead ORDER BY CreatedDate ASC];
        System.debug('question_10 = '+leadLst);
    }
    public static void question_11_method(){
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email,CreatedDate From Lead ORDER BY CreatedDate DESC];
        System.debug('question_11 = '+leadLst);
    }
    public static void question_12_method(){
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email From Lead WHERE Status='Closed - converted' ORDER BY CreatedDate DESC];
        System.debug('question_12 = '+leadLst);
    }
    public static void question_13_method(){
        List<Account> accLst=[SELECT Id,Name from Account ORDER BY Id ASC LIMIT 20];
        System.debug('question_13 = '+accLst);
    }
    public static void question_14_method(){
        List<Account> accLst=[SELECT Id,Name from Account ORDER BY AnnualRevenue DESC LIMIT 50 OFFSET 10 ];
        System.debug('question_14 = '+accLst);
    }
    public static void question_15_method(){
        Date myDate1=date.newInstance(2023, 4, 15);
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email From Lead WHERE CreatedDate > :myDate1];
        System.debug('question_15 = '+leadLst);
    }
    public static void question_16_method(){
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email From Lead WHERE CreatedDate > TODAY];
        System.debug('question_16 = '+leadLst);
    }
    public static void question_17_method(){ 
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email From Lead WHERE CreatedDate > YESTERDAY];
        System.debug('question_17 = '+leadLst);
    }
    public static void question_18_method(){
        List<Lead> leadLst=[SELECT Name, status, LeadSource, Email From Lead WHERE CreatedDate >= LAST_N_DAYS:10];
        //List<Lead> leadLst1=[SELECT Name, status, LeadSource, Email From Lead WHERE CreatedDate < TODAY Order by CreatedDate DESC LIMIT 10];
        System.debug('question_18 = '+leadLst);
    }
    public static void question_19_method(){
        List<Lead> leadLst=[SELECT Name, status, LeadSource, CreatedDate,Email From Lead WHERE CreatedDate >= LAST_MONTH];
        //List<Lead> leadLst1=[SELECT Name, status, LeadSource, Email From Lead WHERE CreatedDate < TODAY Order by CreatedDate DESC LIMIT 10];
        System.debug('question_19 = '+leadLst);
    }
    public static void question_20_method(){
        List<Contact> contactLst=[SELECT Id,LastName,FirstName, Account.Name from contact where Account.Name LIKE 'India%'];
        System.debug('question_20 = '+contactLst);
    }
    
}


// AssignmentTaskSOQL.question_1_method();
// AssignmentTaskSOQL.question_2_method();
// AssignmentTaskSOQL.question_3_method();
// AssignmentTaskSOQL.question_4_method();
// AssignmentTaskSOQL.question_5_method();
// AssignmentTaskSOQL.question_6_method();
// AssignmentTaskSOQL.question_7_method();
// AssignmentTaskSOQL.question_8_method();
// AssignmentTaskSOQL.question_9_method();
// AssignmentTaskSOQL.question_10_method();
// AssignmentTaskSOQL.question_11_method();
// AssignmentTaskSOQL.question_12_method();
// AssignmentTaskSOQL.question_13_method();
// AssignmentTaskSOQL.question_14_method();
// AssignmentTaskSOQL.question_15_method();
// AssignmentTaskSOQL.question_16_method();
// AssignmentTaskSOQL.question_17_method();
// AssignmentTaskSOQL.question_18_method();
// AssignmentTaskSOQL.question_19_method();
// AssignmentTaskSOQL.question_20_method();