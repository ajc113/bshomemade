# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "B's Homemade Icecream <emails@bhomemade.com>"
  layout 'mailer'
end
