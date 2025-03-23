@isTest
public with sharing class QueryLeadMappingCMDT_Mock extends QueryLeadMappingCMDT {
    
    public QueryLeadMappingCMDT_Mock(List<Better_Lead_Field_Mapping__mdt> records) {
        this.mockRecords = records;
    }
    List<Better_Lead_Field_Mapping__mdt> mockRecords;

    public override List<FieldDefinition> fetchFieldDefinitionsByDurableIds() {
        return this.mockRecords;
    }
}