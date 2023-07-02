class JobApplicantsController < ApplicationController
  def new
    @job_applicant = JobApplicant.new
  end

  def create
    @job_applicant = CreateJobApplicant.new(params).call

    if verify_captcha? && @job_applicant.valid?
      redirect_to new_job_applicant_path, notice: 'Your application has been submitted successfully.'
    else
      render :handle_error, status: :unprocessable_entity
    end
  end

  private

  def verify_captcha?
    @recaptcha_result = true if params[:recaptcha_result] == 'verified'
    return @recaptcha_result if @recaptcha_result

    @recaptcha_result = verify_recaptcha action: 'contact_form', minimum_score: 0.7, secret_key: ENV['RECAPTCHA_SECRET_KEY_V3']
  end
end