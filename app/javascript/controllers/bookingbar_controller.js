import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookingbar"
export default class extends Controller {
  static targets = [ "bookingform", "bookingbackground" ]

  connect() {
  }

  show() {
    this.bookingformTarget.classList.remove("hidden")
    this.bookingbackgroundTarget.classList.remove("hidden")
  }
   
  hide() {
    this.bookingformTarget.classList.add("hidden")
    this.bookingbackgroundTarget.classList.add("hidden")
  }
}
