# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "B's Icecream Truck <hello@bhomemade.com>"
  

  layout 'mailer'

end
