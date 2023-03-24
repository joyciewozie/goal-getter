import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="highlight"
export default class extends Controller {
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
        '<div id="tool]tip" style="position:absolute; top: ' +
          posY +
          "px; left: " +
          posX +
          'px;"><div class="tooltiptext"><a href="#" onClick=\'window.open(menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600");\'><i class="fa fa-copy"></i> Save text</a></div></div>'
      );
    }

    fetch("/highlights", {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify({"saveText": saveText})
    })




  }
}
