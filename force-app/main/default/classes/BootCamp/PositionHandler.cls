public class PositionHandler {
	 Public static void newPosition(List<Position__c> newPosition){
        for(Position__c position:newPosition){
            if(position.Open_Date__c==null &&position.Min_Pay__c==null && position.Max_Pay__c==null ){
            	position.Open_Date__c=Date.today();
            	position.Min_Pay__c=10000;
            	position.Max_Pay__c=15000;             
            }
        }      
    }   
    Public static void newTask(Map<Id,Position__c> newPosition) {        
        User userObj=[Select id,Name from User where Name='Zaid Shaikh']; 
        for(Position__c position:newPosition.values()){    
            if(position.Status__c=='New Position'){
                Task createTask=new Task();
                createTask.Subject='Trigger Task';
                createTask.Status='In Progress ';
                createTask.ActivityDate=System.today()+7;
                createTask.WhatId=position.Id;
                createTask.OwnerId=userObj.id;
                insert createTask;          
            }
        }    
    }
}