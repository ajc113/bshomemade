class Trailer < ApplicationRecord

validates :firstname, :lastname, :detail, :email, :phone, :date, :address1, :city, :state, :zip, :eventstart,  presence: true



 private

  # def start_at_not_in_past
  #   if start_at.present? && start_at < Date.current
  #     errors.add(:start_at, "must be on or after today's date")
  #   end
  # end


end
