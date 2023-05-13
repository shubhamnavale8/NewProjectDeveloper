public class HandlerForCandidateTrigger {
    public static void validateSalaryMethod(List<Candidate_Shubham__c> candidateObjectList){
        for(Candidate_Shubham__c candidateObject:candidateObjectList){
            if(candidateObject.Expected_Salary__c==null){
                candidateObject.Expected_Salary__c.addError('Expected Salary field is missing');
            }
        }
    }
    public static void ActiveJobsMethod(List<Candidate_Shubham__c> candidateList){
        
        List <Job_Shubham__c> jobList = [Select Id,Name,Active__c from Job_Shubham__c];        
        Map<Id,Job_Shubham__c> jobMap = new Map<Id,Job_Shubham__c>();       
        for(Job_Shubham__c job : jobList)        {
            jobMap.put(job.Id,job);
        }               
        for(Candidate_Shubham__c candidate : candidateList)       {
			Id job = candidate.Job_Shubham__c;
            Job_Shubham__c jobShubham = jobMap.get(job);           
            if(jobShubham.Active__c==false){
                candidate.Id.addError('This job Field is Not Active');
            }          
        }          
    }
    public static void ApplicationDateMethod(List<Candidate_Shubham__c> candiDateObjectPass){
            List<Candidate_Shubham__c> candidateList = new List<Candidate_Shubham__c>();
            for(Candidate_Shubham__c candidateObj : candiDateObjectPass) {    
                Candidate_Shubham__c cloneObject = candidateObj.clone(true,true,true,true);
                cloneObject.Application_Date__c = candidateObj.CreatedDate.date();
        		System.debug(cloneObject.Application_Date__c);
                candidateList.add(cloneObject);
            }
            Database.update(candidateList);
    }
    public static Boolean candidateNumberMatchApplicant(List<Candidate_Shubham__c> candidateObjectList ){
        Boolean EmailSendcheck=false;
		// List<Job_Shubham__c> jobListObject=new List<Job_Shubham__c>();
        // for(Candidate_Shubham__c obj : candidateObjectList){
        //    Job_Shubham__c jobObjects=[select Id,Manager__c,LastModifiedDate , Total_position__c, Hired_Applicants__c,Active__c from Job_Shubham__c where Id =:obj.Job_Shubham__c];
        //    System.debug(jobObjects);
        //     if(jobObjects.Total_position__c <= jobObjects.Hired_Applicants__c){
        //         jobObjects.Active__c=false;
        //         List<Contact> contactList=[select Id, Email from Contact where Id=:jobObjects.Manager__c];
        //         for(Contact contactObject:contactList){
        //             EmailMissionSpecialist emailspl = new EmailMissionSpecialist();
        //         	EmailSendcheck=emailspl.sendMail(contactObject.Email,'Application is Full','All required candidate has been hired for this job on Job Last Modified Date '+jobObjects.LastModifiedDate);   
        //         }
        //     	jobListObject.add(jobObjects);
        //     }
            
        // }
        // Database.update(jobListObject,false);
        
        List<Messaging.SingleEmailMessage> emailMessages = new List<Messaging.SingleEmailMessage>();
        List<Job_Shubham__c> jobListForMap = [select RecordTypeId,Name,Total_position__c,Hired_Applicants__c,Manager__r.Email,LastModifiedDate from Job_Shubham__c];
        List<Job_Shubham__c> jobListToUpdate = new List<Job_Shubham__c>();
        Map<Id,Job_Shubham__c> jobMap = new Map<Id,Job_Shubham__c>();
        
        if(jobListForMap != null){
            for(Job_Shubham__c job : jobListForMap){
                jobMap.put(job.Id,job);
            }
        }

        for(Candidate_Shubham__c candidate : candidateObjectList){
            Id jobId = candidate.Job_Shubham__c;
            Job_Shubham__c job = jobMap.get(jobId);
            System.debug(job.Hired_Applicants__c+' --- Hired Applicants ::: Total Positions '+job.Total_position__c);
            if(((job.Hired_Applicants__c+1) == job.Total_position__c)){
                job.Active__c = false;
                jobListToUpdate.add(job);

                // Create the email message and add it to the list
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new List<String>{job.Manager__r.Email});
                email.setSubject('Regarding hired Candidate');
                email.setPlainTextBody('All required candidate has been hired for this job on '+job.LastModifiedDate);
                emailMessages.add(email);
            }
        }
        Database.update(jobListToUpdate,false);
        Messaging.sendEmail(emailMessages);
        return EmailSendcheck;
    }
}