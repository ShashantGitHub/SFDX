public with sharing class ContactTriggerEmail {
    public static void triggerHandler(List<Contact> newContacts) {

        Set<String> emailSet = new Set<String>();
        for(contact con: newContacts){
            if(con.Email != null){
                emailSet.add(con.Email);
            }
        }

        if(emailSet.isEmpty()){
            return;
        }
        
        Map<String, Contact> emailToContactMap = new Map<String, Contact>();
        for(Contact con: [Select Id, Email from contact where Email IN :emailSet]){
            emailToContactMap.put(con.Email, con);
        }
        
        for(Contact con : newContacts){ {
            if(con.Email != null && emailToContactMap.containsKey(con.Email)
               && con.Id != emailToContactMap.get(con.Email).Id) {

                con.addError('Duplicate email not allowed.');
            }

    }
}
}
}