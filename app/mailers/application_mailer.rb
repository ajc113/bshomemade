# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "B's Icecream Truck <hello@bhomemade.com>", reply_to: 'Bs Icecream Truck <bsicecreamtruck@gmail.com>'
  

  layout 'mailer'

end
