class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  paginates_per 5
  ATTACHMENT_NAMES_REGEX = /\[(.*?)\]/

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :description

  def content_to_plain_text
    plain_text_content = description.to_plain_text

    return unless plain_text_content.present?

    plain_text_content.gsub(ATTACHMENT_NAMES_REGEX, '')
  end
end
