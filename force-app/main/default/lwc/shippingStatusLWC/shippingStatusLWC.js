import { LightningElement, api, track } from 'lwc';
import getShipmentStatus from '@salesforce/apex/ShipmentStatusController.getShipmentStatus';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ShippingStatusLWC extends LightningElement {
    @api recordId;
    @track status;
    @track error;

    connectedCallback() {
        if (this.recordId) {
            this.fetchStatus();
        }
    }

    fetchStatus() {
        getShipmentStatus({ recordId: this.recordId })
            .then(result => {
                this.status = result;
                this.error = undefined;
            })
            .catch(error => {
                this.status = undefined;
                this.error = 'Error fetching status';
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }
}
