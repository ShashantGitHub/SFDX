//When a Contact is updated, update custom fields on related Opportunities.
public with sharing class UseCaseEight {
    public static void triggerHandler(List<Contact> contactList, Map<Id, Contact> oldContactMap){

        Set<Id> contactIds = new Set<Id>();
        for(Contact con: contactList){
            Contact oldCon = oldContactMap.get(con.Id);
            if(con.Email != oldCon.Email || con.Phone != oldCon.Phone){
                contactIds.add(con.Id);
            }
        }
        if(contactIds.isEmpty()){
            return;
        }
        Map<Id, Contact> updatedContacts = new Map<Id, Contact>([SELECT Id, Email, Phone FROM Contact WHERE Id IN :contactIds]);

        List<Opportunity> oppsToUpdate = new List<Opportunity>();
        for(Opportunity opp :[SELECT Id, ContactId FROM Opportunity WHERE ContactId IN :contactIds]){
            if(updatedContacts.containsKey(opp.ContactId)){
                Contact con = updatedContacts.get(opp.ContactId);
                opp.Email__c = con.Email;
                opp.Phone__c = con.Phone;
                oppsToUpdate.add(opp);
            }

        }
    } 
}