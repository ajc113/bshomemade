class Faq < ApplicationRecord
  include RichTextToPlainText

  validates :question, presence: true

  has_rich_text :answer

  acts_as_list

  after_commit :update_faq_schema

  private

  def update_faq_schema
    Rails.cache.delete('faq_schema')

    Rails.cache.fetch('faq_schema') do
      FaqSchemaGenerator.new.generate_schema(Faq.order(position: :asc))
    end
  end
end
