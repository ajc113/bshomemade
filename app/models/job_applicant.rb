class JobApplicant < ApplicationRecord
  validates :first_name, :last_name, :phone_number, :work_location, :position, :start_at,
            :unavailability_reason, :high_school_attendee_year, :college_attendee_year, :job_history,
            :valid_age_range_work_permit, :fav_icecream_flavor, :referee_referrer_name, presence: true

  validates :email, presence: true, uniqueness: true
  validates :hours_available, presence: true, numericality: { in: 1..80, message: "must be in valid range" }
  validate :start_at_not_in_past
  
  after_create :send_email_notifications
  
  # Send email notifications to admin and applicant after successful creation
  def send_email_notifications
    # Notify admin
    JobApplicantMailer.with(
      applicant_email: email,
      applicant_name: first_name,
      selected_position: position
    ).notify_admin.deliver_later
    
    # Notify applicant
    JobApplicantMailer.with(
      applicant_email: email,
      applicant_name: first_name
    ).notify_applicant.deliver_later
  end

  private

  def start_at_not_in_past
    if start_at.present? && start_at < Date.current
      errors.add(:start_at, "must be on or after today's date")
    end
  end
end
