@isTest
public class testAuthorTrigger {
	@istest
    public static void testownerUpdateDescriptionMethod(){
        List<Author__c> authorObjectList=new List<Author__c>();
        for(Integer itrAuthor=0; itrAuthor<20; itrAuthor++){
            Author__c authorObject=new Author__c();
            authorObject.Name='Test Name_'+itrAuthor;
            authorObjectList.add(authorObject);
        }
        Database.insert(authorObjectList);
        List<Author__c> authorObjectListcheck=[select Id,Description__c from Author__c];
       
        for(Author__c authorObject1:authorObjectListcheck){
            
            System.assertEquals('Shubham Navale', authorObject1.Description__c);   
        }
    }
}