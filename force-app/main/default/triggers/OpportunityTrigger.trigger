trigger OpportunityTrigger on Opportunity (before insert, before update, after update) {

    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        UseCaseHundread.triggerHandler(Trigger.new);
    }

    if(Trigger.isInsert && Trigger.isBefore){
        UseCaseNintyNine.triggerHandler(Trigger.new);
    }

    if(Trigger.isBefore &&(Trigger.isInsert || Trigger.isUpdate)){
        UseCaseNintyEight.triggerHandler(Trigger.new);
    }
    
    if(Trigger.isBefore &&(Trigger.isInsert || Trigger.isUpdate)){
        UseCaseNintySeven.triggerHandler(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        UseCaseNintySix.triggerHandler(Trigger.new, Trigger.oldMap);
    }
}