@isTest
private class AccountUpdateOpportunityTest {

    @testSetup
    static void dataSetup() {
        Account acc = new Account(Name='Test Acc');
        insert acc;

        insert new Opportunity(
            Name='Opp',
            StageName='Prospecting',
            CloseDate=Date.today(),
            AccountId=acc.Id
        );
    }

    @isTest
    static void testClosedWon() {

        Opportunity opp = [SELECT Id, AccountId FROM Opportunity LIMIT 1];
        opp.StageName = 'Closed Won';

        Test.startTest();
        update opp;
        Test.stopTest();

        Account acc = [SELECT Description FROM Account WHERE Id=:opp.AccountId];
        System.assertEquals('Customer Won', acc.Description);
    }
}
