@IsTest
private class AccountManagerTest {
    
    @isTest static void getAccountTest(){
    	Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'
            + recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
         // Verify results
        System.assert(thisAccount!= null);
        System.assertEquals('test Account', thisAccount.Name);
    }
    
    
    // Helper method
    static Id createTestRecord() {
        Account objAccount = new Account(Name = 'test Account');
        insert objAccount;
        
        Contact objContact = new Contact(LastName = 'test Contact',
                                         AccountId = objAccount.Id);
        
        insert objContact;
        
        return objAccount.Id;
    }
    

}