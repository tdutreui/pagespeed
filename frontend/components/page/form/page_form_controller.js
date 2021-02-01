import { Controller } from "stimulus";
import {displayNotification} from "../../notification/notification";

export default class extends Controller {
  connect() {
    this.element.addEventListener("ajax:success", (event) => {
      displayNotification("Updated", 'validate')
    });
    this.element.addEventListener("ajax:error", (event) => {
      displayNotification("Error", 'error')
    });
  }
}
