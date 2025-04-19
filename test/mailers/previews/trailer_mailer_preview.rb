# Preview all emails at http://localhost:3000/rails/mailers/trailer_mailer
class TrailerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/trailer_mailer/notify_lead
  def notify_lead
    TrailerMailer.notify_lead
  end

  # Preview this email at http://localhost:3000/rails/mailers/trailer_mailer/notify_shop
  def notify_shop
    TrailerMailer.notify_shop
  end

  # Preview this email at http://localhost:3000/rails/mailers/trailer_mailer/acknowledgment
  def acknowledgment
    trailer = Trailer.last || Trailer.new(
      firstname: "Sample",
      lastname: "User",
      email: "sample@example.com",
      date: Date.today,
      eventstart: Time.now,
      address1: "123 Main St",
      city: "Sample City",
      state: "MA",
      zip: "12345",
      guest: 50
    )
    TrailerMailer.acknowledgment(trailer)
  end

end
