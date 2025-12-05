public with sharing class UseCaseNintyFive {
    public static void triggerHandle(List<Contact> cntlist, Map<Id, Contact> oldMap) {

        Set<Id> accountIds = new Set<Id>();
        Set<String> emailset = new Set<String>();

        for(Contact cnt : cntlist){
            if(cnt.AccountId != null && cnt.Email!= null){
                emailset.add(cnt.Email.toLowerCase());
                accountIds.add(cnt.AccountId);
            }
        }
        if(emailset.isEmpty() || accountIds.isEmpty()){
            return;
        }
            }
        }
    