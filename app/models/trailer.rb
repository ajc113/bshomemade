class Trailer < ApplicationRecord

validates :firstname, :lastname, :detail, :email, :phone, :date, :address1, :city, :state, :zip, :eventstart, :guest,  presence: true

after_create_commit :send_emails

 private

  # def start_at_not_in_past
  #   if start_at.present? && start_at < Date.current
  #     errors.add(:start_at, "must be on or after today's date")
  #   end
  # end

  def send_emails
    # Send notification email to shop owners
    TrailerMailer.notify_shop(self).deliver_later
    
    # Send acknowledgment email to the customer
    TrailerMailer.acknowledgment(self).deliver_later
  end

end
