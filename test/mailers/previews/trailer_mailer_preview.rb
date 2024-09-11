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

end
