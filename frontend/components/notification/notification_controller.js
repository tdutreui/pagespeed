import {Controller} from "stimulus";


export default class extends Controller {
  static targets = ["block", "content"];

  //severities: danger validate info error
  initialize() {
    this.layouts=['top-left', 'top-right', 'bottom-left'] //layout classes
    this.hide();
    this.timeouts = [];

    this.element.addEventListener('change', (e) => {
      this.clearTimeOuts();
      this.clearStyles();

      this.contentTarget.innerHTML = e.detail.message;
      this.blockTarget.classList.add(e.detail.severity);
      // this.element.style.display = '';
      this.element.classList.add('is-notification-visible')
      this.element.classList.add(e.detail.layout)
      this.timeouts.push(window.setTimeout(() => this.hide(), 5000))
    });

    this.element.addEventListener('hide', (e) => {
      this.hide();
    });
  }

  hide() {
    // this.element.style.display = 'none'
    this.element.classList.remove('is-notification-visible')
    this.element.classList.remove(...this.layouts)//remove listµ. '...' casts an Array to a list i.e. "","",""
  }

  clearStyles() {
    this.blockTarget.classList.remove("info", "error", "danger", "validate");
  }

  clearTimeOuts() {
    this.timeouts.forEach(timeout => window.clearTimeout(timeout))
  }
}
