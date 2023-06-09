import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal","popup"]

  connect() {
    // console.log(this.modalTarget);
  }

  showModal() {
    this.modalTarget.classList.add("show")
    this.popupTarget.classList.add("show")

    window.addEventListener('keyup', this.keyDispatcher.bind(this))
  }

  keyDispatcher(e) {
    if(e.key == "Escape") {
      this.closeModal()
    }
  }

  closeModal() {
    window.removeEventListener("keyup", this.keyDispatcher)
    this.modalTarget.classList.remove("show")
    this.popupTarget.classList.remove("show")
  }
}
