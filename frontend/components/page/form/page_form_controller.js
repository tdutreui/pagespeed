import {Controller} from "stimulus";
import {displayNotification} from "../../notification/notification";

export default class extends Controller {
    connect() {
        this.element.addEventListener("ajax:success", (event) => {
            displayNotification("Updated", 'validate')
        });
        this.element.addEventListener("ajax:error", (event) => {
            let errorCode = event.detail[0] && event.detail[0].code
            let message;
            if (errorCode === 'LOGGED_OUT') {
                message = 'You should login to update this'
            } else {
                message = "Error"
            }
            displayNotification(message, 'error')
        });
    }
}
