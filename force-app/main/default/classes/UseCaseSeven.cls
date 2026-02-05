//Prevent Opportunity creation if the related Account’s Status = "Inactive"
public with sharing class UseCaseSeven {
    public static void triggerHandler(List<Opportunity> oppList) {

        //need to collect all Account Ids from the Opportunity list
        Set<Id> OpportunityAccountIds = new Set<Id>();
        for(Opportunity opp: oppList){
            if(opp.AccountId != null){
                OpportunityAccountIds.add(opp.AccountId);
            }
        }if(OpportunityAccountIds.isEmpty()){
            return;
        }
        //query all Accounts related to the Opportunities
        Map<Id,Account> accountMap = new Map<Id,Account>([Select Id, Status__c from Account where Id IN :OpportunityAccountIds]);

        //iterate through the Opportunity list and check the related Account's Status
        for(Opportunity opp: oppList){
            Account acc = accountMap.get(opp.AccountId);
            if(acc != null && acc.Status__c == 'Inactive'){
                opp.addError('Cannot create Opportunity for Inactive Account');
            }
    }
}
}