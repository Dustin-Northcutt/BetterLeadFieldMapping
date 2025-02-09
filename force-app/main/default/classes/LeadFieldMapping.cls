public with sharing class LeadFieldMapping {

    public static void mapBetterLeadFields(){
        Better_Lead_Field_Mapping__mdt mdt = Better_Lead_Field_Mapping__mdt.getInstance('test');
        Better_Lead_Field_Mapping__mdt mdt2 = Better_Lead_Field_Mapping__mdt.getInstance('test2');
        System.debug('MDT: ' + mdt.Field__c);
        Set<string> fields = new Set<string>{mdt.Field__c, mdt2.Field__c};
        List<Object> records = QueryToolingAPI.retrieveMetadata(fields);
        system.debug('Records: ' + records[0].get(0));
        //see here: https://hicglobalsolutions.com/blog/how-to-harness-the-power-of-salesforce-tooling-api/

    }

    private static List<FieldDefinition> getFieldInfo(Set<String> fieldIds) {

    }
}
