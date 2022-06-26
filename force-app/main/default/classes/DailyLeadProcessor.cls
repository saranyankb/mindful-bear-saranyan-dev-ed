public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext cx){
        List<Lead> lstLead = [select Id, LeadSource from Lead
                              where LeadSource = '' 
                              LIMIT 200 ];
        
        
        for(Lead lsLead : lstLead){
            lsLead.LeadSource = 'Dreamforce';       
        }

        update lstLead;


    }
}