public with sharing class UseCaseNintyEight {
    public static void triggerHandler(List<Opportunity> oppList) {

        Date todayDate = System.today();

        for(Opportunity opp : oppList){

            if(opp.CloseDate != null){
                Integer ageInDays = todayDate.daysBetween(opp.CloseDate);

                opp.Opportunity_Age__c = ageInDays;
            }
        }
    }
}