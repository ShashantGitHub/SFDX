public with sharing class OpportunityAccountService {

    /**
     * Method: getAccountByOpportunity
     * Purpose: Returns the Account linked to a given Opportunity Id
     */
    public static Account getAccountByOpportunity(Id opportunityId) {

        // Validate input
        if (opportunityId == null) {
            return null;
        }

        // Query Opportunity and get Account
        Opportunity opp = [
            SELECT Id, Name, AccountId,
                   Account.Name, Account.Industry, Account.Phone
            FROM Opportunity
            WHERE Id = :opportunityId
            LIMIT 1
        ];

        return opp.Account;     // return the linked Account
    }
}
