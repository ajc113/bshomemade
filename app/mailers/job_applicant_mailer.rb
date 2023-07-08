class JobApplicantMailer < ApplicationMailer
  def notify_admin
    mail(to: 'brookeshomemade@gmail.com', subject: 'New Job Application Received via Website')
  end

  def notify_applicant
    mail(to: params[:applicant_email], subject: 'Application Submitted Successfully')
  end
end
