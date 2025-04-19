import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "token"];
  static values = { siteKey: String, action: String };

  connect() {
    console.log("reCAPTCHA v3 controller connected");
    console.log(`Site key: ${this.siteKeyValue}`);
    console.log(`Action: ${this.actionValue}`);
    console.log(`Form target found: ${this.hasFormTarget}`);
    console.log(`Token target found: ${this.hasTokenTarget}`);

    this.executeRecaptcha();
    
    if (this.formTarget) {
      console.log(`Form ID: ${this.formTarget.id}`);
      this.formTarget.addEventListener("submit", (e) => {
        if (!this.tokenTarget.value) {
          console.log("No token found, preventing form submission and generating new token");
          e.preventDefault();
          this.executeRecaptcha(() => this.formTarget.submit());
        } else {
          console.log(`Token already exists: ${this.tokenTarget.value.substring(0, 10)}...`);
        }
      });
    }
  }

  executeRecaptcha(callback) {
    if (typeof grecaptcha !== 'undefined') {
      console.log("Executing reCAPTCHA");
      grecaptcha.ready(() => {
        console.log(`Calling grecaptcha.execute with action: ${this.actionValue}`);
        grecaptcha.execute(this.siteKeyValue, {action: this.actionValue}).then((token) => {
          console.log("reCAPTCHA token generated");
          console.log(`Token: ${token.substring(0, 10)}...`);
          this.tokenTarget.value = token;
          console.log(`Token set in field: ${this.tokenTarget.id || 'unnamed field'}`);
          if (callback) callback();
        }).catch(error => {
          console.error("reCAPTCHA execution error:", error);
        });
      });
    } else {
      console.error("grecaptcha is not defined");
      console.log("Script loaded?", typeof window.grecaptcha !== 'undefined');
      console.log("Window object keys:", Object.keys(window).filter(key => key.includes('captcha')));
    }
  }
}
