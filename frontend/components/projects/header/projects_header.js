import "./projects_header.scss";

import {Application} from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers"
const context = require.context('./', true, /_controller\.js$/);
Application.start().load(definitionsFromContext(context))
