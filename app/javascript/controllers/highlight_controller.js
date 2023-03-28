import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="highlight"
export default class extends Controller {
  static values = {
    goal: String,
    answer: String
  }

  static targets = ["content", "tooltip"]

  connect() {
    // console.log(this.element);
  }

  selectText() {

    this.tooltipTarget.innerHTML = ""

    this.textContent = document.getSelection().toString();
    if (this.textContent.length > 5) {
      var scrollTop =
        window.pageYOffset !== undefined
          ? window.pageYOffset
           : (
              document.documentElement ||
              document.body.parentNode ||
              document.body
            ).scrollTop;

      const posX = event.clientX;
      const posY = event.clientY - 20 + scrollTop;
      // console.log(this.answerValue)
      // console.log(this.goalValue)
      const style = "position:relative"
      this.tooltipTarget.innerHTML = (
        `
        <div id="tooltip" style="${style}">
          <div data-action="click->highlight#saveText" class="tooltiptext">
            <a><i class="fa fa-copy"></i> Save text</a>
          </div>
        </div>
        `
      );
    }
  }

  saveText() {
    fetch("/highlights", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/plain"
      },
        body: JSON.stringify({
          "goal_id": this.goalValue,
          "answer_id": this.answerValue,
          "text": this.textContent,
        })
    })
    .then((response) => response.text())
    .then((data) => {
      this.tooltipTarget.innerHTML = ""
      this.contentTarget.innerHTML = data
      // alert("Text saved! Visit Highlights page to see all highlights");

    });
  }
}
