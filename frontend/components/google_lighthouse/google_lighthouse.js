import {Application} from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers"

const context = require.context("./", true, /\.js$/)
const application = Application.start()
application.load(definitionsFromContext(context))

import "./google_lighthouse.css";
import "./google_report_generator.css";

