public with sharing class UseCaseThree {

    private static Boolean isExecuted = true;
    
    public static void triggerHandler(List<Contact> newContacts) {

        if(!isExecuted){
            return;
        }
        isExecuted = false;

        Set<String> emailSet = new Set<String>();
        for(Contact con: newContacts){
            if (String.isNotBlank(con.Email)){
                emailSet.add(con.Email.toLowerCase());
            }
            if(emailSet.isEmpty()){
                return;
            }
        }

        Map<String, Contact> emailToContact = new Map<String, Contact>();
        for(Contact c: [Select Id, Email from Contact where Email IN :emailSet]){
            emailToContact.put(c.Email.toLowerCase(), c);
        }
        
        for(Contact con: newContacts){
            if(String.isNotBlank(con.Email) && emailToContact.containsKey(con.Email.toLowerCase())){
                con.addError('Email already Exist');
            }
        }

    }
}