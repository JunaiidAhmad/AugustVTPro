ShippingStatusLWC Component
Overview
The ShippingStatusLWC is a Lightning Web Component (LWC) designed to display the shipping status of a particular shipment based on the recordId of a Shipment__c record in Salesforce. The component interacts with a custom Apex controller to fetch the shipping status from an external mock API endpoint.

Features
Displays Shipment Status: Fetches and displays the shipment status using an external API.
Handles Errors Gracefully: Shows an error message if there is an issue fetching the status.
Responsive Design: Built using Salesforce Lightning Design System (SLDS) to ensure a consistent user experience.
Use Case
This component is particularly useful in scenarios where users need to quickly check the status of a shipment directly from a record page in Salesforce. It can be added to any Lightning record page that involves the Shipment__c object, providing real-time updates on shipping statuses.

How It Works: 
LWC Component Structure
HTML (shippingStatusLWC.html):
The component uses a lightning-card to display the shipment status or an error message. The status is displayed conditionally based on the successful fetch operation.

JavaScript (shippingStatusLWC.js):
The component fetches the shipment status using an Apex controller method. It sets the status or error based on the response.

Apex Controller (ShipmentStatusController)
The Apex controller queries the Shipment__c object to retrieve the tracking number and sends a GET request to an external mock API to retrieve the shipment status.
