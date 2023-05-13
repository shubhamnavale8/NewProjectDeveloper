@RESTResource(urlMapping='/CreateAccount/')
global  class classForRestAPI {
    @HTTPPost
    global static String postMethod (){
        String AName,Descre,fieldName,fieldValue;
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        String jsonString=req.requestBody.toString();
        JSONParser parserObject=JSON.createParser(jsonString);
        //System.debug('Body '+arr);
        while(parserObject.nextToken()!=null){
            if(parserObject.getCurrentToken()!=JSONToken.END_OBJECT){
                fieldName=parserObject.getCurrentName();
                fieldValue=parserObject.getText();
                if(fieldName=='Name'){
                    AName=fieldValue;
                }
                if(fieldName=='Description'){
                    Descre=fieldValue;
                }
            }    
        }
        Account accountObject=new Account(Name=AName,Description=Descre);
        insert accountObject;
        return 'hello shubham';
    }    
}