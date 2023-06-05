public class JobAppliationTriggerHandler {
    public static void beforeInsertStatusNewPosition(List<Job_Application__c> lstJobApplication){
        for(Job_Application__c jobObj:lstJobApplication){
            jobObj.Status__c='New';
        }
    }
    public static void afterPositionVancancyFull(List<Job_Application__c> lstJobApplication,Map<Id,Job_Application__c> oldJobApplications){
        Set<Id> postionsId =new set<Id>();
        postionsId.add(oldJobApplications.Values().Position__c);
        Map<Id,Position__c> mapPosition=new Map<Id,Position__c>([Select Id,Name,Number_Of_Vacancy__c  From Position__c Where Id IN:postionsId]);
        Map<Id,Job_Application__c> mapAllJobApplication=new Map<Id,Job_Application__c> ([Select Id,Name,Candidate__c,Position__c From Job_Application__c Where Position__c IN :postionsId AND Status__c = 'Hired']);
        for(Job_Application__c objJobApplication:lstJobApplication){
          if(objJobApplication.status__c != oldJobApplications.get(objJobApplication.Id).Status__c && objJobApplication.Status__c == 'Hired' && mapAllJobApplication.Size()==mapPosition.get(objJobApplication.Position__c).Number_Of_Vacancy__c ){  
            objJobApplication.Status__c.addError('Positions Vaccancies are Full');     
          }
        }
    }
}