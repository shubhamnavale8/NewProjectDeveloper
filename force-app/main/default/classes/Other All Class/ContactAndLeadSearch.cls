public with sharing class ContactAndLeadSearch {

    public static  List<List< sObject>> searchContactsAndLeads(String dataString){
    
    List<List<sObject>> listOflistObject=[FIND 'Smith' IN ALL FIELDS RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
    return listOflistObject;
}
}