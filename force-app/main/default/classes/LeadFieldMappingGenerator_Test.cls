@isTest
public with sharing class LeadFieldMappingGenerator_Test {
    @isTest
    public static void itCreatesLeadFieldMappings(){
        Better_Lead_Field_Mapping__mdt mdt = new Better_Lead_Field_Mapping__mdt(
             Field__c = String.valueOf(UUID.randomUUID())
            ,Object__c = 'Account'
            ,Overwrite_Behavior__c = 'Overwrite Existing Value'
        );

        QueryLeadMappingCMDT_Mock queryMock = new QueryLeadMappingCMDT_Mock(new List<Better_Lead_Field_Mapping__mdt>{mdt});

        LeadFieldMappingGenerator generator = new LeadFieldMappingGenerator(queryMock);
        List<LeadFieldMapping> leadFieldMappings = generator.getLeadFieldMappings();
        System.debug('Size :' + leadFieldMappings.size());
    }
}