public class DailyLeadUpdateLeadSourceSchedule implements Schedulable {
	public static void execute(SchedulableContext sc){
        List<Lead> leadObjectList=[select Id,Name,LeadSource from Lead where LeadSource='' Limit 200];
        List<Lead> leadObjectList2=new List<Lead>();
        for(Lead leadObject:leadObjectList){
            leadObject.LeadSource='Web';
            leadObjectList2.add(leadObject);
        }
        Database.update(leadObjectList2,false);
    }
}