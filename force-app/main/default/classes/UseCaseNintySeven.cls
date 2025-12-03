public with sharing class UseCaseNintySeven {
    public static void triggerHandler(List<Opportunity> opplist, Map<Id, Account> oldMap) {

        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : opplist){
        Opportunity oldOpp = oldMap.get(opp.Id);
            if(opp.AccountId != null && oldOpp.StageName != 'Closed Lost' && opp.StageName == 'Closed Lost'){
                accountIds.add(opp.AccountId);       
        }   
    }
    if(AccountId.isEmpty()){
        return;
    }
    Map<Id, Account>  accountMap = new Map<Id,Account>([Select Id, StageName from Account where Id in :accountIds]);
    
    for(Opportunity opp : opplist){
        if(opp.AccountId != null && opp.StageName == 'Closed Lost' && accountMap.containsKey(opp.AccountId)){
            Account acc = accountMap.get(opp.AccountId);
        }
        if(acc.isActive == true){
            opp.addError('Opp with Closed Lost Stage cannot be created for Active Account');
        }
    }
}
}
