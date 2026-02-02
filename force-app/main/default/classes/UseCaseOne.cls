public with sharing class UseCaseOne {
    public static void triggerHandler(List<Opportunity> oldList) {
       
        for(Opportunity opp: oldList){
            if(opp.StageName == 'Closed Won'){
                opp.addError('You can Not Opportunity stage Closed Won');

            }
        }

    }
}