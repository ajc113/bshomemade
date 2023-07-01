import { Controller } from "@hotwired/stimulus";
import { post } from '@rails/request.js'

export default class extends Controller {
  static values = { url: String, siteKey: String }

  initialize() {
    grecaptcha.render(
      "recaptchaV2",
      {
        sitekey: this.siteKeyValue,
        callback: this.onRecaptchaSuccess.bind(this)
      }
    );

    $('#job-applicant-form').addClass('d-none');
  }

  onRecaptchaSuccess() {
    this.element.style.display = 'none';
    $('#job-applicant-form').removeClass('d-none');

    post(this.urlValue, {
      body: {
        job_applicant: this.jobApplicantParams(),
        recaptcha_result: 'verified',
      },
      responseKind: 'turbo-stream',
      traditional: true
    });
  }

  jobApplicantParams() {
    return ({
        email: $('#applicant_email').val(),
        position: this.selectedPositionValue(),
        start_at: $('#applicant_start_at').val(),
        last_name: $('#applicant_last_name').val(),
        first_name: $('#applicant_first_name').val(),
        job_history: $('#applicant_job_history').val(),
        work_location: this.selectedWorkLocationValue(),
        phone_number: $('#applicant_phone_number').val(),
        hours_available: $('#applicant_hours_available').val(),
        full_year_availability: this.fullYearAvailabilityValue(),
        fav_icecream_flavor: $('#applicant_fav_icecream_flavor').val(),
        referee_referrer_name: $('#applicant_referee_referrer_name').val(),
        college_attendee_year: $('#applicant_college_attendee_year').val(),
        unavailability_reason: $('#applicant_unavailability_reason').val(),
        high_school_attendee_year: $('#applicant_high_school_attendee_year').val(),
        valid_age_range_work_permit: $('#applicant_valid_age_range_work_permit').val()
    })
  }

  selectedPositionValue() {
    return document.querySelector("input[type='radio'][name='job_applicant[position]']:checked")?.value;
  }

  selectedWorkLocationValue() {
    return document.querySelector("input[type='radio'][name='job_applicant[work_location]']:checked")?.value;
  }

  fullYearAvailabilityValue() {
    return document.querySelector("input[type='radio'][name='job_applicant[full_year_availability]']:checked")?.value;
  }
}