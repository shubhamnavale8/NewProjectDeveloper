public class LeadTriggerTaskHandler {

    public static void pritendEmailDuplicationLeadInsert(List<Lead> leadLst){
        // Map<String,Lead> emailMap=new  Map<String,Lead>();
        // for(Lead lst:leadLst) {
        //     emailMap.put(lst.Email,lst);
        // }
        // List<Contact> countList=[Select Id,LastName,Email from Contact where Email=:emailMap.values().Email];
        // System.debug('countList------------------------'+countList);
        // if(countList.size()>0){
        //     for(Contact cont:countList){
        //         emailMap.get(cont.Email).Email.addError(Label.LeadEmailError);
        //     }
        // }
    }
     public static void pritendEmailDuplicationLeadUpdate(Map<Id,Lead> mapObject){
        // System.debug('mapObject------------------------'+mapObject);
        // Map<String,Lead> emailMap=new  Map<String,Lead>();
        // for(Lead lst:mapObject.values()) {
        //     emailMap.put(lst.Email,lst);
        // }
        // List<Contact> countList=[Select Id,LastName,Email from Contact where Email=:mapObject.values().Email];
        // System.debug('countList------------------------'+countList);
        // if(countList.size()>0){
        //     for(Contact cont:countList){
        //         emailMap.get(cont.Email).Email.addError(Label.LeadEmailError);
        //     }
        // }
    }
}