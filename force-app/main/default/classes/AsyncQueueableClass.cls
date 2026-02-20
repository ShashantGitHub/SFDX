public with sharing class AsyncQueueableClass {
    public static void triggerHandler(List<Case> cases) {
        List<Case> casesToProcess = new List<Case>();
        for(Case c : cases){
            if(c.Status == 'escalated'){
                casesToProcess.add(c);
            }   
    }
    if(!casesToProcess.isEmpty()){
        System.enqueueJob(new AsyncClassOne(casesToProcess));
    }
}
}