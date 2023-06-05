public class ControllerRecruitment {
    static Integer otp=0;
    @AuraEnabled(cacheable=true)
    public static List<Candidate__c> usernamePasswordAuth(String usName,String pass){
        System.debug('usName'+usName+'  pass'+pass);
        List<Candidate__c> objCandidate = [Select Id,Password__c,Username__c,Candidate_Name__c from Candidate__c where Username__c=:usName AND Password__c=:pass];
        System.debug('objCandidate=:'+objCandidate);
        return objCandidate;
    }

    @AuraEnabled(cacheable=true)
    public static List<Position__c> allPositionRecruitment(String canId,Integer itr){
        List<Position__c> lstPosition=[SELECT Id, Name, (SELECT Candidate__c FROM Job_Applications__r) FROM Position__c WHERE Id IN (SELECT Position__c FROM Job_Application__c WHERE Candidate__c =:canId)];
        Map<String,Position__c> mapLst=new Map<String,Position__c>(); 
        set<String> positionName=new set<String> ();
        for(Position__c pObj:lstPosition){
            positionName.add(pObj.Name);
        }
        List<Position__c> objPosition=[SELECT Id, Name, Skills_Required__c,Close_Date__c, RecordTypeId FROM Position__c WHERE Name NOT IN : positionName];
        return objPosition;
    }

    @AuraEnabled(cacheable=true)
    public static List<Position__c> appliedPositionRecruitment(String canId,Integer itr){
        List<Position__c> lstPosition=[SELECT Id, Name, (SELECT Candidate__c FROM Job_Applications__r) FROM Position__c WHERE Id IN (SELECT Position__c FROM Job_Application__c WHERE Candidate__c =:canId)];
        Map<String,Position__c> mapLst=new Map<String,Position__c>(); 
        set<String> positionName=new set<String> ();
        for(Position__c pObj:lstPosition){
            positionName.add(pObj.Name);
        }
        List<Position__c> objPosition=[SELECT Id, Name, Skills_Required__c,Close_Date__c, RecordTypeId FROM Position__c WHERE Name IN : positionName];
        return objPosition;
    }

    @AuraEnabled
    public static Boolean jopApplication(String posId,String canId){
        Boolean flag=false;
        try{
            Job_Application__c objJob=new Job_Application__c(Candidate__c=canId,Position__c=posId);
            Database.insert(objJob);
            flag=true;
        }
        catch(Exception ex){
            flag=false;
        }
        return flag;
    }

    @AuraEnabled
    public static Integer optGenrator(){
        otp =Math.round((Math.random() * (900000) + 100000));
        return otp;
    }

    @AuraEnabled
    public static Boolean otpSendOnMail(String Email1,Integer OTPnew){
        Boolean flag=false;
        try{
            System.debug('OTPnew'+OTPnew+'  ..........');
            System.debug('Email1'+Email1);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new List<String>{ Email1 });
                mail.setSubject('One time password for Create new Password');
                mail.setPlainTextBody('One Time Pasword : '+OTPnew);
                //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                Messaging.SingleEmailMessage[] messages =  new List<Messaging.SingleEmailMessage> {mail};
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            flag=true;
        }
        catch(Exception ex){
            System.debug('Email Message :-'+ex.getMessage());
            flag=false;
        }
      return flag;  
    }

    @AuraEnabled(cacheable=true)
    public static List<Candidate__c> emailOfCandidate(String Email){
        System.debug('Email '+Email);
        List<Candidate__c> objCandidate = [Select Id,Password__c,Username__c,Candidate_Name__c,Email__c  from Candidate__c where Email__c =:Email];
        System.debug('objCandidate=:'+objCandidate);
        return objCandidate;
    }
    @AuraEnabled
    public static Boolean passwordChangeMethod(String Email,String passwordNew){
        Boolean flag=false;
        try {
            List<Candidate__c> objCandidate = [Select Id,Password__c, Confirm_Password__c,Username__c,Candidate_Name__c,Email__c  from Candidate__c where Email__c =:Email];
            List<Candidate__c> candiList=new List<Candidate__c>();

            for(Candidate__c can:objCandidate){
                can.Password__c=passwordNew;
                can.Confirm_Password__c=passwordNew;
                candiList.add(can);
            }
            Database.update(candiList,false);
            flag=true;
        } catch (Exception e) {
            
            flag=false;
        }
        return flag;
    }
}

//System.debug('OTP Is Genrate : - '+ControllerRecruitment.optGenrator());
//ControllerRecruitment.otpSendOnMail('savintambe@gmail.com',ControllerRecruitment.optGenrator());