@isTest
public class testRestApiForContact {
    static testMethod void testPostMethod(){

        RestRequest request = new RestRequest();
        request.requestUri ='https://salesforce.com/services/apexrest/CreateContact';
        request.httpMethod = 'POST';
        request.requestBody=Blob.valueOf('{"LastName":"Test_Contact"}');
        RestContext.request = request;
        List<Contact> contObject=[SELECT Id ,Name FROM Contact where Name='Test_Contact'];
       // System.assertEquals(1,contObject.size() ) ;
    }
}