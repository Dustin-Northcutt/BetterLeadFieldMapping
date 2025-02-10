public with sharing class LeadFieldMappingGenerator {
    public static List<LeadFieldMapping> getLeadFieldMappings() {
        List<LeadFieldMapping> leadFieldMappings = new List<LeadFieldMapping>();
        // Better_Lead_Field_Mapping__mdt mdtMap = Better_Lead_Field_Mapping__mdt.getAll();
        
        Map<string, LeadFieldMapping> fieldIdMappingsMap = new Map<string, LeadFieldMapping>();
        Set<string> fieldIds = new Set<string>();
        for (Better_Lead_Field_Mapping__mdt mdt : Better_Lead_Field_Mapping__mdt.getAll().values()) {
            LeadFieldMapping leadFieldMapping = new LeadFieldMapping();
            leadFieldMapping.objectName = mdt.Object__c;
            if (mdt.Overwrite_Behavior__c == 'Overwrite Existing Value') {
                leadFieldMapping.overWriteExisting = true;
            } else {
                leadFieldMapping.overWriteExisting = false;
            }
            fieldIdMappingsMap.put(mdt.Field__c, leadFieldMapping);
            fieldIds.add(mdt.Field__c);
        }

        Map<String, FieldDefinition> fieldDefMap = new Map<string, FieldDefinition>();
        for (FieldDefinition fieldDef : [SELECT id, QualifiedApiName, Label
                                         FROM FieldDefinition
                                         WHERE durableId IN :fieldIds]) {
            LeadFieldMapping leadFieldMapping = fieldIdMappingsMap.get(fieldDef.durableId);
            leadFieldMapping.fieldAPIName = fieldDef.QualifiedApiName;
            leadFieldMapping.fieldLabel = fieldDef.Label;
            fieldIdMappingsMap.put(fieldDef.DurableId, leadFieldMapping);
        }

        return fieldIdMappingsMap.values();
    }
}