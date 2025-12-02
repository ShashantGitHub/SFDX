public with sharing class UseCaseHundread {
    public static void triggerHandler(List<Opportunity> oppList) {
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : oppList){
            if(opp.AccountId != null){
                accountIds.add(opp.AccountId);
            }
        }
        if(accountIds.isEmpty()){
            return;
        }
        Map<Id, Account> accountMap = new Map<Id, Account>([Select Id, Name from Account where Id in :accountIds]);

        for(Opportunity opp : oppList){
            if(Opp.AccountId!= null && accountMap.contains(opp.AccountId)){
                opp.Name = accountMap.get(opp.AccountId).Name;
            }
            }
        }
    }