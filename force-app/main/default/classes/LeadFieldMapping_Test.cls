@isTest
public with sharing class LeadFieldMapping_Test {

    @isTest
    public static void itUpdatesAccount(){
        Account a = new Account(name = 'test');
        SObject record = (SObject) a;
        String newValue = 'newValue';
        record.put('customField__c', newValue);

        Assert.areEqual(record.get('customField__c'), newValue);
    }

}