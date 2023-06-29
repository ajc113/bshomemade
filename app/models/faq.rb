class Faq < ApplicationRecord
  include RichTextToPlainText

  validates :question, presence: true

  has_rich_text :answer
end
