Schema.DescribeSObjectResult dsrCase = Case.sObjectType.getDescribe();
Map<String, Schema.SObjectFIeld> myMap = dsrCase.fields.getMap();
Map<String,String> fieldApiLableMap = new Map<String, String>();
for (Schema.SObjectField fieldDescribe : dsrCase.fields.getMap().values()) {
    fieldApiLableMap.put(fieldDescribe.getDescribe().getName(),fieldDescribe.getDescribe().getLabel());
    System.debug('API Name: ' + fieldDescribe.getDescribe().getName());
    System.debug('Label: ' + fieldDescribe.getDescribe().getLabel());

}