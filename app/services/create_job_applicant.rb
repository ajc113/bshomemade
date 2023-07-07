class CreateJobApplicant
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def call
    job_applicant = JobApplicant.new(job_applicant_params)

    send_email_notification(job_applicant) if job_applicant.save

    job_applicant
  end

  private

  def job_applicant_params
    params.require(:job_applicant).permit(
      :email, :first_name, :last_name, :phone_number, :work_location, :position, :start_at,
      :hours_available, :full_year_availability, :unavailability_reason, :high_school_attendee_year,
      :college_attendee_year, :valid_age_range_work_permit, :job_history, :fav_icecream_flavor, :referee_referrer_name
    )
  end

  def send_email_notification(job_applicant)
    JobApplicantMailer.with(
      applicant_email: job_applicant.email,
      applicant_name: job_applicant.first_name,
      selected_position: job_applicant.position
    ).notify_admin.deliver_later

    JobApplicantMailer.with(
      applicant_email: job_applicant.email,
      applicant_name: job_applicant.first_name
    ).notify_applicant.deliver_later
  end
end
