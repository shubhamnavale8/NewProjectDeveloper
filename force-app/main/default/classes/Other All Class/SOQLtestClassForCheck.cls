public with sharing class SOQLtestClassForCheck {
    public SOQLtestClassForCheck() {

    }

    public void accountAndContactSOQLmethod(){

        //fetching all records of Account object
        List<Account> accountObject=[select Fields(Standard) FROM Account];
        for(Account val: accountObject){
            System.debug('\n'+val);
        }

        //fetching all records from Contact which are assosiated with Acoount by using account name  
        List<Contact> forContactDetails=[select Id,FirstName,LastName  FROM Contact WHERE Account.Name='United Oil & Gas Corp.'];

        for(Contact val2: forContactDetails){
            System.debug('\n'+val2);
        }

        //Fetching all contact with Account Number And Id
        List<Contact> forContactToAccountNo=[select FirstName,LastName,Account.Id,Account.AccountNumber from Contact];

        for(Contact val3: forContactDetails){
            System.debug('\n'+val3);
        }
        // For Group by We Have to use AggregateResult as well as for Aggregate Function
        List<AggregateResult> accountWithContact =[select Name,COUNT(AccountNumber) From Account GROUP BY Name ];
        AggregateResult value=[select COUNT(Email) From Contact];
        Integer Val=(Integer)value.get('expr0');
        // error mesage for this Query is := Grouped query cannot use child relationships in the SELECT list (28:43)
        String name='shubham';
        List<List<SObject>> ssobjects=[FIND :name in ALL Fields Returning Contact(LastName,FirstName),Account,Lead];
        
    }
}