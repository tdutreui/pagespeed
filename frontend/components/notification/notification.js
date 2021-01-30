import "./notification.scss";
import {Application} from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers"
const context = require.context('./', true, /_controller\.js$/);
Application.start().load(definitionsFromContext(context))

import {mergeDeep} from "../../lib/object-utils";

export function displayNotification(message, optionsOrSeverity) {
    let detail={message: message }
    if (typeof optionsOrSeverity == 'string') {
        //called as displayNotification('message', 'severity')
        let severity=optionsOrSeverity;
        detail['severity']=severity
    } else {
        //called as displayNotification(message, {severity: 'error',... })
        let options=optionsOrSeverity;
        detail=mergeDeep(detail,options)
    }

    document.getElementById("notification").dispatchEvent(
        new CustomEvent(
            "change",
            {detail: detail}
        )
    )
}

export function hideNotification() {
    document.getElementById("notification").dispatchEvent(
        new CustomEvent("hide" )
    )
}