class JobApplicantMailer < ApplicationMailer
  def notify_admin
    mail(to: 'admin@example.com', subject: 'Received New Applicantion')
  end

  def notify_applicant
    mail(to: params[:applicant_email], subject: 'Application Submitted Successfully')
  end
end
