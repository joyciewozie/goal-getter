import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-page"
export default class extends Controller {
  static targets = ["button", "input", "cancel"]

  connect() {
    console.log("I'm reborn")
  }

  hide() {
    this.buttonTarget.classList.add("inactive")
    this.inputTarget.classList.remove("comment-form-inactive")
  }

  close(){
    this.buttonTarget.classList.remove("inactive")
    this.inputTarget.classList.add("comment-form-inactive")
  }
}
