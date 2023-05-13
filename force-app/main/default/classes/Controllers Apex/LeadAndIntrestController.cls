public class LeadAndIntrestController {
    
    @AuraEnabled(cacheable=true)
    public static List<Interest__c> getInterests() {
        return [SELECT Id, Name, Interest_Type__c ,Description__c FROM Interest__c];
    }

    @AuraEnabled(cacheable=true)
    public static List<Interest__c> getInterestsOnSearch(String searchStr) {
        String str='SELECT Id, Name, Interest_Type__c ,Description__c FROM Interest__c Where Name LIKE \'%'+searchStr+'%\'';
        return Database.query(str);
    }

    // @AuraEnabled(cacheable=true)
    // public static void addInterestsToLead(Id leadId, Id interestId) {
    //     System.debug('leadId = '+leadId+' interestId = '+interestId);
    //     try{
    //         Lead leadRecord = [SELECT Id, Interest__c FROM Lead WHERE Id = :leadId];
    //         if (leadRecord.Interest__c == null) {
    //             System.debug('Lead Is Passed'+leadRecord);
    //             leadRecord.Interest__c = interestId;
    //             update leadRecord;
    //         }
    //     }
    //     catch(Exception ex){
    //         throw new AuraHandledException('Lead already has an interest populated.');
    //     }  
    // }

    @AuraEnabled
    public static void addInterestsToLead(String leadId, String interestId) {
     // Lead leadRecord = new Lead(Id = leadId, Interest__c = interestId);
     // update leadRecord;
     List<Lead> lead =new List<Lead>();
     Lead leadRecord = [SELECT Id, Interest__c FROM Lead WHERE Id = :leadId];
      if (leadRecord.Interest__c != null) {
        throw new AuraHandledException('Lead already has an interest populated.');
      }
      leadRecord.Interest__c = interestId;
      lead.add(leadRecord);
      update lead;
    }
}