class SubscribeController < ApplicationController
  def create
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.mailchimp_api_key, debug: true)
    begin
      gibbon.lists(Rails.application.credentials.mailchimp_list_id).members.create(body: {
        email_address: params[:email],
        status: "subscribed",
        merge_fields: {:FNAME => self.fname, :LNAME => self.lname}
      })
      render json: { 'success': "Thanks for joining check your mailbox for our specials" }
    rescue Gibbon::MailChimpError => e
      puts e.class
      puts e.raw_body.class
      puts JSON.parse(e.raw_body)['detail']
      render json: { error: JSON.parse(e.raw_body)['detail'] }, status: :bad
    end
  end
end







  # def add_user_to_list
  #   gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'], debug: true)
  #   begin
  #     gibbon.lists(ENV["MAILCHIMP_LIST_ID_NEWSLETTER"]).members.create(body: { 
  #       email_address: self.email,
  #       status: "subscribed",
  #       merge_fields: {:FNAME => self.first_name, :LNAME => self.last_name}
  #     })
  #   rescue Gibbon::MailChimpError => error
  #     GithubIssues.create(error, self.class.name, __method__, self.inspect)
  #   end
  # end