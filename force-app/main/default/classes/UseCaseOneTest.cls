@isTest
private class UseCaseOneTest {
    @TestSetup
    static void createTestDate(){
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30),
            AccountId = acc.Id
        );
        insert opp;
    }
    @isTest
    static void testCasePositive(){
        Opportunity opp = [Select Id, stageName from Opportunity Limit 1];
        opp.StageName = 'Negotiation/Review';
        Test.startTest();
        update opp;
        Test.stopTest();
        Opportunity oppAfterUpdate = [Select Id, stageName from Opportunity where Id =: opp.Id];
        System.assertEquals('Negotiation/Review', oppAfterUpdate.StageName);
    } 
   @isTest
static void testUpdateBlockedIfAlreadyClosedWon() {

    Opportunity opp = [SELECT Id, StageName FROM Opportunity LIMIT 1];

    // First make it Closed Won
    opp.StageName = 'Closed Won';
    update opp;

    // Try updating again
    opp.Name = 'Updated Name';

    Test.startTest();
    try {
        update opp;
        System.assert(false, 'Expected DmlException was not thrown');
    } 
    catch (DmlException e) {

        System.assert(
            e.getDmlMessage(0).contains('You cannot update Opportunity once it is Closed Won'),
            'Expected error message not found'
        );
    }
    Test.stopTest();
}

}