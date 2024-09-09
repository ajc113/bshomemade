class TrailerMailer < ApplicationMailer
  def notify_trailer
    mail(to: 'costa.aj@gmail.com', subject: 'New Trailer Lead Received via Website')
  end


  def notify_applicant
    mail(to: params[:email], reply_to: 'bsicecreamtruck@gmail.com', subject: 'Ice Cream Truck Iquiry Succesfully Sentx')
  end

end
