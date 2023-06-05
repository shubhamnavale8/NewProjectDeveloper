public class AuthorTaskTriggerHandler {
    public static void gmailMailId(List<Author__c> authorLst){
        for(Author__c aut:authorLst){
            if(aut.Email__c.contains('@gmail.com')){
                aut.Email__c.addError(Label.AuthorEmailError+' For @gmail.com');
            }  
        }   
    }
    public static void enzigmaMailId(List<Author__c> authorLst){
        for(Author__c aut:authorLst){
            if(aut.Email__c.contains('@enzigma.com')){
                aut.Email__c.addError(Label.AuthorEmailError+' For @enzigma.com');
            }  
        }
    }
    public static void skypeMailId(List<Author__c> authorLst){
        for(Author__c aut:authorLst){
            if(aut.Email__c.contains('@skype.com')){
                aut.Email__c.addError(Label.AuthorEmailError+' For @skype.com.co');
            }  
        }
    }
    public static Boolean customSettingActiveMethod(){

        AuthorTaskCustomSetting__c authCustom=AuthorTaskCustomSetting__c.getInstance();
        return authCustom.Active__c;
    }
}
//SELECT Email__c, Id, Mobile_Number__c FROM Author__c