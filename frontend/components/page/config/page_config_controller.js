import { Controller } from "stimulus";


export default class extends Controller {
  static targets=['item','tooltip']
  connect() {
    this.itemTargets.forEach((t,index)=>{
      let tooltip=this.tooltipTargets[index];
      t.addEventListener('mouseover', function (e) {
        tooltip.style.display="block";
      });

      t.addEventListener('mouseout', function (e) {
        tooltip.style.display="none";
      });
    })
  }
}