trigger CaseTrigger on Case (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
    AsyncQueueableClass.triggerHandler(Trigger.new);
}
}