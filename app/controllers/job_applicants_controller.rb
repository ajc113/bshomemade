class JobApplicantsController < ApplicationController
  include RecaptchaVerifiable

  def new
    @job_applicant = JobApplicant.new
  end

  def create
    @job_applicant = JobApplicant.new(job_applicant_params)

    respond_to do |format|
      if verify_recaptcha_v3(params[:recaptcha_token], 'job_application')
        if @job_applicant.save
          # Email notifications are handled by the model's after_create callback
          format.turbo_stream
          format.html { redirect_to new_job_applicant_path, notice: 'Your application has been submitted successfully.' }
          format.json { render :show, status: :created }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @job_applicant.errors, status: :unprocessable_entity }
        end
      else
        flash.now[:alert] = "reCAPTCHA verification failed. Please try again."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { error: "reCAPTCHA verification failed" }, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def job_applicant_params
    params.require(:job_applicant).permit(
      :email, :phone_number, :first_name, :last_name, :start_at, 
      :hours_available, :unavailability_reason, :high_school_attendee_year,
      :college_attendee_year, :valid_age_range_work_permit, :job_history,
      :fav_icecream_flavor, :referee_referrer_name, :full_year_availability,
      :work_location, :position
    )
  end
end