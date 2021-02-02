import { Controller } from "stimulus";
import {showAnalyzerBar} from "../../analyzer/bar/analyzer_bar";

export default class extends Controller {
  connect() {

  }

  showAnalyzer() {
    showAnalyzerBar()
  }

}
