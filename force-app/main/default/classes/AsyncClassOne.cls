public with sharing class AsyncClassOne implements Queueable {

    public List<Case> caseRecord;

    public AsyncClassOne(List<Case> casesToProcess){
        caseRecord = casesToProcess;
    }
    public static void execute(QueueableContext context) {
        List<Task> tasksToInsert = new List<Task>();
        for(Case cs : caseRecord){
            Task t = new Task();
            t.Subject = 'Follow up on escalated case';
            t.WhatId = cs.Id;
            t.OwnerId = cs.OwnerId;
            t.ActivityDate = Date.today().addDays(30);
            tasksToInsert.add(t);
        }
        if(!tasksToInsert.isEmpty()){
            insert tasksToInsert;
        }
        System.debug('AsyncClassOne executed');
    }
}