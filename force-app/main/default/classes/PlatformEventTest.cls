@isTest
public class PlatformEventTest {
    @isTest static void test1(){
        //Create test event instance
       /* Cloud_News__e newsEvent =  new Cloud_News__e(
            Location__c = 'Mountain City',
            Urgent__c = true,
            News_Content__c = 'Test Message.');*/
        Order_Event__e orderEvent = new Order_Event__e(
        	Has_Shipped__c = true,
        	Order_Number__c = '105');

        Test.startTest();
        Database.SaveResult sr = EventBus.publish(orderEvent);
        Test.stopTest();
        //Perform validation here
        //Verify that the publish was successful
        System.assertEquals(true, sr.isSuccess());
        //Check that the case that the trigger created is present
        List<Task> lstTask = [Select Id from Task];
        //Validate that this case was found.
        // There is only one test case in test context.
        System.assertEquals(1, lstTask.size());
    }
}