trigger ContactTrigger on Contact (before insert, before update) {
    
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        UseCaseNintyFive.triggerHandler(Trigger.new, Trigger.oldMap);
    }
}