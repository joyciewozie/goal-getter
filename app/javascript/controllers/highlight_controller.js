import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="highlight"
export default class extends Controller {
  static values = {
    answer: String,
    text: String
  }

  connect() {
    console.log("I'm here");
  }

  selectText() {

    if(document.contains(document.getElementById("tooltip"))) {
      document.getElementById("tooltip").remove();
    }

    const saveText = document.getSelection().toString();
    if (saveText.length > 5) {
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

      document.body.insertAdjacentHTML(
        "beforeend",
        '<div data-controller="highlight" data-highlight-answer-value="' + this.answerValue + '" data-highlight-text-value="' + saveText +'" id="tooltip" style="position:absolute; top: ' +
          posY +
          "px; left: " +
          posX +
          'px;"><div data-action="click->highlight#saveText" class="tooltiptext"><a><i class="fa fa-copy"></i> Save text</a></div></div>'
      );
    }
  }

  saveText() {
    console.log(JSON.stringify({
      "answer_id": this.answerValue,
      "text": this.textValue
    }))
    fetch("/highlights", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"},
      body: JSON.stringify({
        "answer_id": this.answerValue,
        "text": this.textValue
      })
    }).then((response)=>response.json())
    .then((data)=>{
      window.alert("bookmark saved")
      console.log(document.getElementById("tooltip"))
      document.getElementById("tooltip").remove()
    });
  }
}
