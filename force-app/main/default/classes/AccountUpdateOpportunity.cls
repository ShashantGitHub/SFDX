public with sharing class AccountUpdateOpportunity {

    public static void triggerHandler(List<Opportunity> newList,
                                     Map<Id, Opportunity> oldMap) {

        Set<Id> accountIds = new Set<Id>();

        for(Opportunity opp : newList) {
            if(opp.StageName == 'Closed Won' &&
               oldMap.get(opp.Id).StageName != 'Closed Won') {

                accountIds.add(opp.AccountId);
            }
        }

        List<Account> accountsToUpdate = [
            SELECT Id, Description FROM Account
            WHERE Id IN :accountIds
        ];

        for(Account acc : accountsToUpdate) {
            acc.Description = 'Customer Won';
        }

        update accountsToUpdate;
    }
}
