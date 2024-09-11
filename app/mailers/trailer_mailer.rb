class TrailerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trailer_mailer.notify_lead.subject
  #
  def notify_lead
    @greeting = "Hi"


    mail(to: "brookeshomemade@gmail.com, costa.aj@gmail.com",
        reply_to: 'Bs Icecream Truck <bsicecreamtruck@gmail.com>',
        subject: 'Inquiry Submitted Succesfully',
      )



  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trailer_mailer.notify_shop.subject
  #
  def notify_shop
    @greeting = "Hi"

      mail(to: "brookeshomemade@gmail.com, costa.aj@gmail.com",
        reply_to: 'Bs Icecream Truck <bsicecreamtruck@gmail.com>',
        subject: 'Received new trailer inquiry',
      )
  end
end
