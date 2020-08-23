import "./google_lighthouse.scss";
import {Util,
    DOM,
    DetailsRenderer,
    CriticalRequestChainRenderer,
    SnippetRenderer,
    Logger,
    ReportUIFeatures,
    DropDown,
    CategoryRenderer,
    PerformanceCategoryRenderer,
    PwaCategoryRenderer,
    ReportRenderer,
} from "./lib/google_report_generator.js";

import {Application} from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers"

const context = require.context("./", true, /\.js$/)
const application = Application.start()
application.load(definitionsFromContext(context))


