public with sharing class UseCaseNintyNine {
    public Static Void triggerHandler(List<Opportunity> opplist) {

        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : Opplist){
            if(opp.AccountId != null){
                accountIds.add(opp.AccountId);
        }
    }
    if(accountIds.isEmpty()){
        return;
    }
    Map<Id, Account> accountMap = new Map<Id, Account>([select Id, isActive from Account where Id in :accountIds]);

    for(Opportunity opp: Opplist){
        if(opp.AccountId != null && accountMap.containsKey(opp.AccountId)){
            Account acc = accountMap.get(opp.AccountId);

            if(acc.isActive == false){
                opp.addError('Account is not active');
            }
            }
        }
    }
}
