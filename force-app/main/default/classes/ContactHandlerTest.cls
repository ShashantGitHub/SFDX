@isTest
private class ContactHandlerTest {

    @testSetup
    static void setupData() {
        insert new Contact(LastName='Test1', Email='abc@test.com');
    }

    @isTest
    static void testDuplicateEmail() {

        Contact c = new Contact(LastName='Test2', Email='abc@test.com');

        Test.startTest();
        try {
            insert c;
            System.assert(false);
        } catch (DmlException e) {
            System.assert(e.getDmlMessage(0).contains('Duplicate email'));
        }
        Test.stopTest();
    }
}
