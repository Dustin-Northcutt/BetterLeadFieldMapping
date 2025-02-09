public with sharing class QueryToolingAPI {
    public static List<Object> retrieveMetadata(Set<string> fieldIds) {
        String fieldsCommaSeparated = fieldIds.toString()
                                                .replace('{', '(\'')
                                                .replace('}', '\')')
                                                .replace(',', '\',\'')
                                                .replace(' ', '');
        System.debug('fieldsCommaSeparated: ' + fieldsCommaSeparated);
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        String url = URL.getOrgDomainUrl().toExternalForm();
        string url1 = url + '/services/data/v51.0/tooling/query?q=' +
                            'Select+Id,+Label,+DeveloperName,+NamespacePrefix+From+FieldDefinition+Where+durableId+IN+' +
                            fieldsCommaSeparated;
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(url1);
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        System.debug(res.getBody());
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        List<Object> records = (List<Object>) results.get('records');
        return records;
        // if (!records.isEmpty()) {
        //     Map<String, Object> record = (Map<String, Object>) records.get(0);
        //     String objectId = (String) record.get('Id');

        //     // Now retrieve the fields for this object
        //     string url2=url + '/services/data/v51.0/tooling/query?q=Select+Id,+DeveloperName,+NamespacePrefix+From+CustomField+where+TableEnumOrId=\'' + objectId + '\'';
        //     req.setEndpoint(url2);
        //     res = http.send(req);
        //     System.debug(res.getBody());

        //     // Parse the response to get the list of fields
        //     Map<String, Object> fieldResults = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        //     List<Object> fieldRecords = (List<Object>) fieldResults.get('records');
        //     List<String> fieldNames = new List<String>();
        //     for (Object fieldRecord : fieldRecords) {
        //         Map<String, Object> field = (Map<String, Object>) fieldRecord;
        //         fieldNames.add((String) field.get('DeveloperName'));
        //     }
        //     System.debug(fieldNames);
        //     // Now retrieve the validation rules for this object
        //     string url3=url + '/services/data/v51.0/tooling/query?q=Select+Id,+ValidationName,+Active+From+ValidationRule+where+EntityDefinitionId=\'' + objectId + '\'';
        //     req.setEndpoint(url3);
        //     res = http.send(req);
        //     System.debug(res.getBody());
        //     // Parse the response to get the list of validation rules
        //     Map<String, Object> validationResults = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        //     List<Object> validationRecords = (List<Object>) validationResults.get('records');
        //     List<String> validationNames = new List<String>();
        //     for (Object validationRecord : validationRecords) {
        //         Map<String, Object> validation = (Map<String, Object>) validationRecord;
        //         validationNames.add((String) validation.get('ValidationName'));
        //     }
        //     System.debug(validationNames);
        // }
    }
}