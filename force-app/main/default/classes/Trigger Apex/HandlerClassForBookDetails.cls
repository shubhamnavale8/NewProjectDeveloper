public class HandlerClassForBookDetails {
    public static void afterUndeleteChangeStatusMethod(List<Book_Details__c> bookListObject){
        List<Book_Details__c> bookObject=new List<Book_Details__c>();
         for(Book_Details__c c : bookListObject){
            Book_Details__c book1=new Book_Details__c();
            book1.Id=c.Id;
            book1.After_Undelete__c = true;
        	bookObject.add(book1);
   		}
        Database.update(bookObject);
    }
}