public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> Accts)
    {
        for (Account a : accts) {
            a.ShippingState = a.BillingState;
        }
    }

}