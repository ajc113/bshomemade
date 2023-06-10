class Lead < ApplicationRecord
validates :fname, :lname, :email, presence: true

after_create :subscribe_user_to_list

  def subscribe_user_to_list
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.mailchimp_api_key, debug: true)
    begin
      gibbon.lists(Rails.application.credentials.mailchimp_list_id).members.create(body: {
        email_address: self.email,
        status: "subscribed",
        merge_fields: {:FNAME => self.fname, :LNAME => self.lname}
      })
    rescue Gibbon::MailChimpError => error
      GithubIssues.create(error, self.class.name, __method__, self.inspect)
    end
  end

end

