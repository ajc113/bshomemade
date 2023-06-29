require 'active_support/concern'

module RichTextToPlainText
  extend ActiveSupport::Concern
  ATTACHMENT_NAMES_REGEX = /\[(.*?)\]/

  def to_plain_text(content)
    plain_text_content = content.to_plain_text

    return unless plain_text_content.present?

    plain_text_content.gsub(ATTACHMENT_NAMES_REGEX, '')
  end
end