
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "first", "second", "third", "fourth"]

  connect() {
    console.log("Hello from insight button Stimulus controller")
  }

  next(event){
    console.log("NExt button clciked")
    // event.preventDefault()
    // find active span
    fetch(
      {
        "answer" => {
          "content" => "sfdsfdsfdsf",
          "template_question_id" => "1"
        }
      }
    )

    const activeSpan = document.getElementsByClassName("span-active")[0]
    activeSpan.classList.add("finish")
    activeSpan.classList.remove("span-active")

    // find the next span
    console.log("active span", activeSpan)
    const nextSpan = activeSpan.nextElementSibling
    console.log("next span", nextSpan)
    nextSpan.classList.add("span-active")
  }
  // thirdPage() {
  //   this.secondformTarget.classList.toggle('d-none')
  //   this.thirdformTarget.classList.toggle('d-none')
  // }
  // var currentTab = 0; // Current tab is set to be the first tab (0)
  // showTab(currentTab); // Display the current tab

  // function validateForm() {
  //   // This function deals with validation of the form fields
  //   var x, y, i, valid = true;
  //   x = document.getElementsByClassName("tab");
  //   y = x[currentTab].getElementsByTagName("input");
  //   // A loop that checks every input field in the current tab:
  //   for (i = 0; i < y.length; i++) {
  //     // If a field is empty...
  //     if (y[i].value == "") {
  //       // add an "invalid" class to the field:
  //       y[i].className += " invalid";
  //       // and set the current valid status to false:
  //       valid = false;
  //     }
  //   }
  //   // If the valid status is true, mark the step as finished and valid:
  //   if (valid) {
  //     document.getElementsByClassName("step")[currentTab].className += " finish";
  //   }
  //   return valid; // return the valid status
  // }

  // function fixStepIndicator(n) {
  //   // This function removes the "active" class of all steps...
  //   var i, x = document.getElementsByClassName("step");
  //   for (i = 0; i < x.length; i++) {
  //     x[i].className = x[i].className.replace(" active", "");
  //   }
  //   //... and adds the "active" class to the current step:
  //   x[n].className += " active";
  // }
}