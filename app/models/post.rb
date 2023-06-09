class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  paginates_per 5

  extend FriendlyId
  friendly_id :title, use: :slugged
end
