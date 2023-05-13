public class ContactSearch {

    public static List<Contact> searchForContacts(string lastname , string postalcode){
        String a=lastname;
        String b=postalcode;
        List<Contact> contactObject=[select ID, Name from Contact where LastName=:a AND MailingPostalCode=:b];
        return contactObject;
    }
}