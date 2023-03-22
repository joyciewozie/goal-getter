import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insight"
export default class extends Controller {
  static targets = ["insights","popleft"]
  connect() {
    console.log("I'm connected")
  }

  showInsights() {
    this.insightsTarget.classList.add("show")
    this.popleftTarget.classList.add("show")
    window.addEventListener('keyup', this.keyDispatcher.bind(this))
  }

  keyDispatcher(e) {
      if(e.key == "Escape") {
        this.closeInsights()
      }
  }

  closeInsights() {
      window.removeEventListener("keyup", this.keyDispatcher)
      this.insightsTarget.classList.remove("show")
      this.popleftTarget.classList.remove("show")
  }
}
