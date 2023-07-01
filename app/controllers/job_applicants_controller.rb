class JobApplicantsController < ApplicationController
  def new
    @job_applicant = JobApplicant.new
  end

  def create
    @job_applicant = JobApplicant.new(job_applicant_params)

    if verify_captcha? && @job_applicant.save
      redirect_to new_job_applicant_path, notice: 'Your application has been submitted successfully.'
    else
      render :handle_error, status: :unprocessable_entity
    end
  end

  private

  def job_applicant_params
    params.require(:job_applicant).permit(
      :email, :first_name, :last_name, :phone_number, :work_location, :position, :start_at,
      :hours_available, :full_year_availability, :unavailability_reason, :high_school_attendee_year,
      :college_attendee_year, :valid_age_range_work_permit, :job_history, :fav_icecream_flavor, :referee_referrer_name
    )
  end

  def verify_captcha?
    @recaptcha_result = true if params[:recaptcha_result] == 'verified'
    return @recaptcha_result if @recaptcha_result

    @recaptcha_result = verify_recaptcha action: 'contact_form', minimum_score: 0.7, secret_key: ENV['RECAPTCHA_SECRET_KEY_V3']
  end
end