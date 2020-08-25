import "./google_lighthouse.scss";

import {Application} from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers"
const context = require.context('./', true, /_controller\.js$/);
Application.start().load(definitionsFromContext(context))
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


