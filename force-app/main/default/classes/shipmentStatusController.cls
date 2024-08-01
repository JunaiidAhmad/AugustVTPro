public with sharing class shipmentStatusController {
    @AuraEnabled(cacheable=true)
    public static String getShipmentStatus(String recordId) {
        // Query the tracking number based on the record ID
        Shipment__c shipment = [SELECT Name FROM Shipment__c WHERE Id = :recordId LIMIT 1];
        
        if (shipment == null || String.isEmpty(shipment.Name)) {
            throw new AuraHandledException('Tracking number cannot be found or is empty.');
        }
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://merzcommunities--mel.sandbox.my.salesforce-sites.com/services/apexrest/mockShipmentStatus?trackingNumber=' + EncodingUtil.urlEncode(shipment.Name, 'UTF-8'));
        req.setMethod('GET');
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            return res.getBody();
        } else {
            throw new AuraHandledException('Error: ' + res.getStatus());
        }
    }
}
