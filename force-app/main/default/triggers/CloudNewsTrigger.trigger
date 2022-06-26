trigger CloudNewsTrigger on Cloud_News__e (after insert) {
    //List to hold all cases to be created
    List<Case> lstCase = new List<Case>();
    //Get a queue Id for case owner
    Group queue = [Select Id from Group Where name = 'Regional Dispatch' AND Type = 'Queue'];
    //Iterate through each notification
    for(Cloud_News__e event : Trigger.new){
        if(event.Urgent__c == true){
            //Create case to dispatch to new team
            Case cs = new Case();
            cs.Priority = 'High';
            cs.Subject = 'News team dispatched to '
                         + event.Location__c;
            cs.OwnerId = queue.Id;
            lstCase.add(cs);
        }

    }
    //Insert all cases corresponding to events received 
    insert lstCase;


}