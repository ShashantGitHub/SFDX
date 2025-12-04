public with sharing class UseCaseNintySix {
    public static void triggerHandler(List<Opportunity> oppList, Map<Id, Opportunity> oldMap) {

        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : oppList){
            Opportunity oldOpp = oldMap.get(opp.Id);
            if(opp.AccountId != null && opp.StageName != oldOpp.StageName){
                accountIds.add(opp.AccountId);
            }
        }
        if(AccountIds.isEmpty()){
            return;
        }
        Map<Id,Account> accountMap = new Map<Id, Account>([Select Id, Name from Account where Id in :accountIds]);

        List<Account> acctoUpdate = new List<Account>();

        for(Opportunity opp : oppList){
            if(opp.AccountId != null  && accountMap.containsKey(opp.AccountId) && opp.StageName!= oldMap.get(opp.Id).StageName){

                Account acc = accountMap.get(opp.AccountId);
                acc.LastActivityDate = opp.CloseDate;
                acctoUpdate.add(acc);
            }
        }
    }
}