trigger ContactTrigger on Contact (before insert, before update, after Insert, after Update) {
    
    // if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
    //     UseCaseNintyFive.triggerHandler(Trigger.new, Trigger.oldMap);
    // }
    // if(Trigger.isBefore && Trigger.isInsert){
    //     UseCaseThree.triggerHandler(Trigger.new);
    // }
    // if(Trigger.isAfter && Trigger.isInsert){
    //     UseCaseSix.triggerHandler(Trigger.new);
    // }
    //if(Trigger.isAfter && Trigger.isUpdate){
    //    UseCaseEight.triggerHandler(Trigger.new, Trigger.old);
    //}
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
         ContactTriggerEmail.triggerHandler(Trigger.new);
    }
}