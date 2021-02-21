import {Controller} from "stimulus";
import {displayNotification} from "../notification/notification";

export default class extends Controller {
    static targets = ['url', 'form']

    connect() {
        this.formTarget.addEventListener("ajax:success", (event) => {
            window.location = event.detail[2].responseURL
        })
        this.formTarget.addEventListener("ajax:error", (event) => {
            let message;
            if (event && event.detail[2] && event.detail[2].status === 422) {
                message = 'Invalid URL'
            } else {
                message = "An unexpected error occurred"
            }
            displayNotification(message, 'error')
            this.urlTarget.disabled = false
            this.urlTarget.classList.add('is-error')
        });

        this.formTarget.addEventListener('ajax:beforeSend', () => {
            this.urlTarget.disabled = true
            this.urlTarget.classList.remove('is-error')
        })

    }
}
