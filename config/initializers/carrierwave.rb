unless Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region:                Rails.application.credentials.dig(:aws, :s3_region),
      host:                  's3.amazonaws.com',
    }
    config.fog_directory  = Rails.application.credentials.dig(:aws, :s3_bucket)
    #config.asset_host = "https://s3-us-east-1.amazonaws.com"
    config.fog_use_ssl_for_aws = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
  end
end