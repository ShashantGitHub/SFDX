public with sharing class UseCaseOne {

    public static void triggerHandler(
        List<Opportunity> newList,
        Map<Id, Opportunity> oldMap
    ) {

        for (Opportunity opp : newList) {

            // Check previous value
            if (oldMap.get(opp.Id).StageName == 'Closed Won') {

                opp.addError('You cannot update Opportunity once it is Closed Won');
            }
        }
    }
}
