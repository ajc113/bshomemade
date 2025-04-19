module RecaptchaVerifiable
  extend ActiveSupport::Concern

  # Verify reCAPTCHA v3 token with Google's API
  def verify_recaptcha_v3(token, action = nil, min_score = 0.5)
    return true if Rails.env.test? # Skip verification in test environment
    
    return false if token.blank?
    
    require 'net/http'
    require 'json'
    
    secret_key = Rails.application.credentials.recaptcha_secret_key_v3
    uri = URI('https://www.google.com/recaptcha/api/siteverify')
    
    response = Net::HTTP.post_form(uri, {
      secret: secret_key,
      response: token
    })
    
    result = JSON.parse(response.body)
    
    # Log result for debugging
    Rails.logger.info("reCAPTCHA result: #{result.inspect}")
    
    # Verify success and check score
    success = result['success'] && result['score'].to_f >= min_score
    
    # If an action is specified, verify it matches
    if action.present?
      success = success && result['action'] == action
    end
    
    success
  end
end
