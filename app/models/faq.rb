class Faq < ApplicationRecord
  include RichTextToPlainText

  validates :question, presence: true

  has_rich_text :answer

  acts_as_list

  after_save :update_faq_schema

  private

  def update_faq_schema
    Rails.cache.delete('faq_schema')
  end
end
