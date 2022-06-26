@isTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '20 30 8 10 2 ?';

    
    public static testMethod void testScheduledJob(){

        List<Lead> lstLead = new List<Lead>();

        for(Integer i=1; i<200; i++){
            Lead testLead = new Lead();
            testLead.FirstName = 'Test '+ i;
            testLead.LastName = 'Test LastName '+ i;
            //testLead.LeadSource = 'Dreamforce';
            testLead.Company = 'Company '+ i;
            lstLead.add(testLead);
        }

        insert lstLead;

        // Get the IDs of the Leads we just inserted

        Map<Id, Lead> leadMap = new Map<Id, Lead>();
        List<Id> leadIds = new List<Id>(leadMap.KeySet());

        Test.startTest();
        String jobId = System.schedule('SchedulableApexTest', CRON_EXP, new DailyLeadProcessor());

        // Verify the scheduled job has not run yet.

        List<Lead> ltLead = [select Id From Lead Where Id IN: leadIds];

        System.assertEquals(0, ltLead.size(), 'Leads exist before job has run');
         // Stopping the test will run the job synchronously
         Test.stopTest();
         // Now that the scheduled job has executed,
        // check that our tasks were created
        ltLead = [Select Id from Lead where Id IN: leadIds];

        System.assertEquals(leadIds.size(), ltLead.size(), 'Tasks were not created');

    }


}