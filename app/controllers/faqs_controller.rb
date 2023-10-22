class FaqsController < ApplicationController
  def index
    @faqs = Faq.order(position: :asc)
    @schema = Rails.cache.fetch('faq_schema') do
      FaqSchemaGenerator.new.generate_schema(@faqs)
    end
  end
end