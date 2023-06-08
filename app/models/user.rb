class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :bees
  after_create :subscribe_user_to_list

  def subscribe_user_to_list
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.dig(:mailchimp_api_key), debug: true)
    begin
      gibbon.lists(Rails.application.credentials.dig(:mailchimp_list_id)).members.create(body: {
        email_address: self.email,
        status: "subscribed",
        merge_fields: {:FNAME => self.fname, :LNAME => self.lname}
      })
    rescue Gibbon::MailChimpError => error
      GithubIssues.create(error, self.class.name, __method__, self.inspect)
    end
  end




end
