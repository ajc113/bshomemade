return if Rails.env.development?

ActionMailer::Base.smtp_settings = {
  address: "smtp.mandrillapp.com",
  port: 587,
  authentication: :plain,
  user_name: Rails.application.credentials.mandrill_user_name,
  password: Rails.application.credentials.mandrill_api_key,
  domain: 'bhomemade.com'
}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_url_options = { host: Rails.application.credentials.host }

MandrillMailer.configure do |config|
  config.api_key = Rails.application.credentials.mandrill_api_key
  config.deliver_later_queue_name = :default
end