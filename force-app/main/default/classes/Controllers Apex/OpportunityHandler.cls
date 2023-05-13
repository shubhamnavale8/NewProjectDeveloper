public class OpportunityHandler {
    public static void opportunityInsertMethod(Map<Id,Opportunity> oppLst){
        Account accLst=[SELECT Id, Name,Min__c,Max__c from Account Where Id=:oppLst.values().AccountId];
        List<Opportunity> oppObject=[SELECT Id,Min__c,Max__c from Opportunity Where AccountId=:accLst.Id];
        System.debug('List Of Opp ='+oppObject);
        Date[] dteMin=new Date[oppObject.size()];
        Date[] dteMax=new Date[oppObject.size()];
        Integer i=0,j=0;
        for(Opportunity opps:oppObject){
            
                dteMin[i++]=opps.Min__c;
            	dteMax[j++]=opps.Max__c;
            
        }
        dteMin.sort();
        System.debug('Array of Min = '+dteMin[0]);
        dteMax.sort();
        System.debug('Array of Max = '+dteMax[oppObject.size()-1]);
        System.debug('Account Name'+accLst);
        accLst.Min__c=dteMin[0];
        accLst.Max__c= dteMax[oppObject.size()-1];
        update accLst;
    }
    public static void opportunityUpdateMethod(Map<Id,Opportunity> oppLst){
       Account accLst=[SELECT Id, Name,Min__c,Max__c from Account Where Id=:oppLst.values().AccountId];
        List<Opportunity> oppObject=[SELECT Id,Min__c,Max__c from Opportunity Where AccountId=:accLst.Id];
        System.debug('List Of Opp ='+oppObject);
        Date[] dteMin=new Date[oppObject.size()];
        Date[] dteMax=new Date[oppObject.size()];
        Integer i=0,j=0,result=0;
        
        for(Opportunity opps:oppObject){
            
                dteMin[i++]=opps.Min__c;
            	dteMax[j++]=opps.Max__c;
            
        }
        result=oppObject.size()-(i+1);
        for(Opportunity opps:oppObject){
            if(opps.Max__c == null){	
            }
            else{
                dteMax[j++]=opps.Max__c;
            }
        }
        dteMin.sort();
        System.debug('Value Of I  = '+i);
        System.debug('Value Of J  = '+j);
        System.debug('Array of Min All = '+dteMin);
        System.debug('Array of Min = '+dteMin[0]);
        dteMax.sort();
        System.debug('Array of Max All = '+dteMax);
        System.debug('Array of Max = '+dteMax[oppObject.size()-1]);
        System.debug('Account Name'+accLst);
        System.debug('Result = '+result);
        accLst.Min__c=dteMin[result];
        accLst.Max__c= dteMax[oppObject.size()-1];
        update accLst;
    }
    public static void opportunityDeleteMethod(Map<Id,Opportunity> oppLst){
        Account accLst=[SELECT Id, Name,Min__c,Max__c from Account Where Id=:oppLst.values().AccountId];
        List<Opportunity> oppObject=[SELECT Id,Min__c,Max__c from Opportunity Where AccountId=:accLst.Id];
        System.debug('List Of Opp ='+oppObject);
        Date[] dteMin=new Date[oppObject.size()];
        Date[] dteMax=new Date[oppObject.size()];
        Integer i=0,j=0;
        for(Opportunity opps:oppObject){
            
                dteMin[i++]=opps.Min__c;
            	dteMax[j++]=opps.Max__c;
            
        }
        dteMin.sort();
        System.debug('Array of Min = '+dteMin[0]);
        dteMax.sort();
        System.debug('Array of Max = '+dteMax[oppObject.size()-1]);
        System.debug('Account Name'+accLst);
        accLst.Min__c=dteMin[0];
        accLst.Max__c= dteMax[oppObject.size()-1];
        update accLst;
    }
    public static void opportunityUndeleteMethod(Map<Id,Opportunity> oppLst){
        Account accLst=[SELECT Id, Name,Min__c,Max__c from Account Where Id=:oppLst.values().AccountId];
        List<Opportunity> oppObject=[SELECT Id,Min__c,Max__c from Opportunity Where AccountId=:accLst.Id];
        System.debug('List Of Opp ='+oppObject);
        Date[] dteMin=new Date[oppObject.size()];
        Date[] dteMax=new Date[oppObject.size()];
        Integer i=0,j=0;
        for(Opportunity opps:oppObject){
            
                dteMin[i++]=opps.Min__c;
            	dteMax[j++]=opps.Max__c;
            
        }
        dteMin.sort();
        System.debug('Array of Min = '+dteMin[0]);
        dteMax.sort();
        System.debug('Array of Max = '+dteMax[oppObject.size()-1]);
        System.debug('Account Name'+accLst);
        accLst.Min__c=dteMin[0];
        accLst.Max__c= dteMax[oppObject.size()-1];
        update accLst;
    }
}