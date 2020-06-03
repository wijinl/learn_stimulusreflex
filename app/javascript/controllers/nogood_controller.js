import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output", "input" ]

  show() {
    this.outputTarget.textContent = `->${this.inputTarget.value}`
  }
}
