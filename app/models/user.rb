class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :bees
  after_create :subscribe_user_to_list

  def subscribe_user_to_list
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'], debug: true)
    begin
      gibbon.lists(ENV["MAILCHIMP_LIST_ID_"]).members.create(body: { 
        email_address: self.email,
        status: "subscribed",
        # merge_fields: {:FNAME => self.first_name, :LNAME => self.last_name}
      })
    rescue Gibbon::MailChimpError => error
      GithubIssues.create(error, self.class.name, __method__, self.inspect)
    end
  end




end
