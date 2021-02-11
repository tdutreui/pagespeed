import {Controller} from "stimulus";
import {displayNotification} from "../../notification/notification";
import Rails from '@rails/ujs'

export default class extends Controller {
    static targets = ['form', 'checkbox']

    connect() {
        this.element.addEventListener("ajax:success", (event) => {
            displayNotification("Updated", 'validate')
        });
        this.element.addEventListener("ajax:error", (event) => {
            let errorCode = event.detail[0] && event.detail[0].code
            let message;
            if (errorCode === 'LOGGED_OUT') {
                message = 'You must login to update this'
            } else {
                message = "Error"
            }
            displayNotification(message, 'error')
        });

        this.checkboxTargets.forEach(checkboxElement => {
            checkboxElement.addEventListener('change', () => {
                Rails.fire(this.formTarget, 'submit');
            })
        })
    }
}
