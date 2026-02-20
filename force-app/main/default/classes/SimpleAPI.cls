@RestResource(urlMapping='/Opportunity/*')
global with sharing class SimpleAPI {
    @HttpGet
    global static List<Opportunity> getOpenOpps(){

        RestRequest req = RestContext.request;
        String accountId = req.params.get('accountId');

      return [select Id , Name from Opportunity where AccountId =: accountId 
      And isClosed = false];
    }
}