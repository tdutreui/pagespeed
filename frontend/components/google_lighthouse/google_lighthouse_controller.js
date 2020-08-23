import {Controller} from "stimulus";

export default class extends Controller {
    static targets = ['report','action']

    connect() {
        this.showView('mobile')
    }

    show(e) {
        this.showView(e.currentTarget.dataset.strategy)
    }

    showView(strategy) {
        this.actionTargets.forEach(t => {
            if( t.dataset.strategy === strategy) {
                t.classList.add('is-active')
            } else {
                t.classList.remove('is-active')
            }
        })

        this.reportTargets.forEach(t => {
            if( t.dataset.strategy === strategy) {
                t.style.display = ''
            } else {
                t.style.display = 'none'
            }
        })

    }
}
