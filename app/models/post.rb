class Post < ActiveRecord::Base
mount_uploader :image, ImageUploader
paginates_per 3

  extend FriendlyId
  friendly_id :title, use: :slugged




end
