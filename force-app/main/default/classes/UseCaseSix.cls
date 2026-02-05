//When a new Contact is created, automatically populate the Account.LeadSource field using the Contact’s Lead Source.
public with sharing class UseCaseSix {
    public static void triggerHandler(List<Contact> contacts) {
        //Need to collect all the AccountIds from the contacts and query the accounts to get the lead source and then update the lead source of the account if it is different from the contact lead source.
        Set<Id> accountIds = new Set<Id>();
        for(Contact con: contacts){
            if(con.AccountId != null && con.LeadSource != null){
                accountIds.add(con.AccountId);
            }
            if(accountIds.isEmpty()){
                return;
            }
            //Map the account ids to te contact ids
            Map<Id, Account> accountMap = new Map<Id, Account>([Select Id, LeadSource from Account where Id IN :accountIds]);
            
            //Create a list of accounts to update
            List<Accont> accountsToUpdate = new List<Account>();

            for(Contact con: contacts){
                if(accountMap.containsKey(con.AccountId)){
                    Account acc = accountMap.get(con.AccountId);
                    if(acc.LeadSource != con.LeadSource){
                        acc.LeadSource = con.LeadSource;
                        accountsToUpdate.add(acc);
                    }
                }
            }
            if(accountIds.isEmpty()){
                return;
            }
            update accountsToUpdate;
    }
}
}