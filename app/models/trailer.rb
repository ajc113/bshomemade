class Trailer < ApplicationRecord
  validates :firstname, :lastname, :detail, :email, :phone, :date, :address1, :city, :state, :zip, :eventstart, :guest, presence: true
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :guest, numericality: { greater_than: 0, message: "must be a positive number" }
  validates :zip, format: { with: /\A\d{5}(-\d{4})?\z/, message: "should be a valid ZIP code (e.g., 12345 or 12345-6789)" }, allow_blank: true
  
  validate :date_not_in_past
  validate :date_not_too_far_in_future

  after_create_commit :send_emails

  private

  def date_not_in_past
    if date.present? && date < Date.current
      errors.add(:date, "must be on or after today's date")
    end
  end
  
  def date_not_too_far_in_future
    if date.present? && date > Date.current + 2.years
      errors.add(:date, "cannot be more than 2 years in the future")
    end
  end

  def send_emails
    # Send notification email to shop owners
    TrailerMailer.notify_shop(self).deliver_later
    
    # Send acknowledgment email to the customer
    TrailerMailer.acknowledgment(self).deliver_later
  end
end
