import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
    // console.log(this.modalTarget);
  }

  showModal() {
    this.modalTarget.classList.add("show")

    window.addEventListener('keyup', e => {
      if(e.ke = "Escape") {
        this.modalTarget.classList.remove("show")
      }
    }, {once: true})
  }
}
