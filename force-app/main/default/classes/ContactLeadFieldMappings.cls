public with sharing class ContactLeadFieldMappings implements LeadFieldMappings_Interface{
    public static Map<String, String> getFieldAPINameLabelMap(){
        Map<String,String> fieldApiLableMap = new Map<String, String>();
        for (Schema.SObjectField fieldDescribe :  Case.sObjectType.getDescribe().fields.getMap().values()) {
            fieldApiLableMap.put(fieldDescribe.getDescribe().getName(),fieldDescribe.getDescribe().getLabel());
        }
        return fieldApiLableMap;
    }
}