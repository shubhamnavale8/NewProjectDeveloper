@RESTResource(urlMapping='/CreateContact')
global class RestApiForContact {
    @HTTPPost
    global static List<Contact> methodForContactRestApi(){
        String LName,fieldName,fieldValue;
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        String jsonString=req.requestBody.toString();
        JSONParser parserObject=JSON.createParser(jsonString);
        while(parserObject.nextToken()!=null){
            if(parserObject.getCurrentToken()!=JSONToken.END_OBJECT){
                fieldName=parserObject.getCurrentName();
                fieldValue=parserObject.getText();
                if(fieldName=='LastName'){
                    LName=fieldValue;
                }
            }    
        }
        Contact contactObject=new Contact(LastName=''+LName);
        insert contactObject;
        List<Contact> contObject=[SELECT Id ,Name FROM Contact where Name=:''+LName];
        return contObject;
    }
    @HTTPPut
    global Static String methodForUpdate(){
        String LName,fieldName,fieldValue;
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        String jsonString=req.requestBody.toString();
        JSONParser parser=JSON.createParser(jsonString);
        while(parser.nextToken()!=null){
            if(parser.getCurrentToken()!=JSONToken.END_OBJECT){
                fieldName=parser.getCurrentName();
                fieldValue=parser.getText();
                if(fieldName=='LastName'){
                    LName=fieldValue;
                }
            }
        }
        List<Contact> contactObject=[select Id, LastName from Contact where LastName=:LName];
        List<Contact> contactObjectUpdate=new List<Contact>();
        for(Contact cout:contactObject){
            cout.LastName=cout.LastName+'_Updated';
            contactObjectUpdate.add(cout);
        }
        Database.update(contactObjectUpdate,false);
        return 'Job Done Update Sucessfully';
    } 
}