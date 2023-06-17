namespace :action_text_migration do
  desc "Migrates plain old description to ActionText"
  task call: :environment do
    Post.all.each do |post|
      post.update!(description: post.read_attribute(:description))
    end
  end
end
