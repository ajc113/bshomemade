import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "token"];
  static values = { siteKey: String, action: String };

  connect() {
    this.executeRecaptcha();
    
    if (this.formTarget) {
      this.formTarget.addEventListener("submit", (e) => {
        if (!this.tokenTarget.value) {
          e.preventDefault();
          this.executeRecaptcha(() => this.formTarget.submit());
        }
      });
    }
  }

  executeRecaptcha(callback) {
    if (typeof grecaptcha !== 'undefined') {
      grecaptcha.ready(() => {
        grecaptcha.execute(this.siteKeyValue, {action: this.actionValue}).then((token) => {
          this.tokenTarget.value = token;
          if (callback) callback();
        }).catch(error => {
          console.error("reCAPTCHA execution error:", error);
        });
      });
    } else {
      console.error("grecaptcha is not defined");
    }
  }
}
