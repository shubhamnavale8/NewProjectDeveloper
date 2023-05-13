public class OppertunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityRecord(String accountId){
        return [SELECT Id, Name, StageName, Amount, Probability, ExpectedRevenue, CloseDate FROM Opportunity WHERE AccountId=:accountId];
    }
}