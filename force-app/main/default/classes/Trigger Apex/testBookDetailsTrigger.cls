@isTest
public class testBookDetailsTrigger {
    @isTest
    public static void testForUpdatedFieldOfBook(){
        List<Book_Details__c> createBookList=new List<Book_Details__c>();
        for(Integer itrForBook=0; itrForBook<20; itrForBook++){
            Book_Details__c createBook=new Book_Details__c();
            createBook.Name='Test Book_'+itrForBook;
            Date mydate=date.newInstance(2023, 1, itrForBook+1);
            createBook.Date_Of_Publish__c=mydate;
            createBookList.add(createBook);
        }
        Database.insert(createBookList,false);
        List<Book_Details__c> deleteBookList=[select Id from Book_Details__c];
        Database.delete(deleteBookList,false);
        List<Book_Details__c> unDeleteBookList1=[select Id from Book_Details__c where isDeleted=true ALL ROWS];
        System.debug(unDeleteBookList1);
        System.debug(Database.undelete(unDeleteBookList1,false));
        //Database.un
        List<Book_Details__c> checkUndeleteBookList=[select Id,After_Undelete__c from Book_Details__c];
        System.debug(checkUndeleteBookList);
        for(Book_Details__c obj:checkUndeleteBookList){
            System.debug(obj.After_Undelete__c);
            System.assertEquals(true,obj.After_Undelete__c);
        }
    }
}