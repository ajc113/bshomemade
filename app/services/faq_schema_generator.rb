require 'json/ld'

class FaqSchemaGenerator
  def generate_schema(faqs)
    schema = {
      '@context': 'https://schema.org/',
      '@type': 'FAQPage',
      'mainEntity': faqs.map do |faq|
        {
          '@type': 'Question',
          'name': faq.question,
          'acceptedAnswer': {
            '@type': 'Answer',
            'text': faq.to_plain_text(faq.answer)
          }
        }
      end
    }

    JSON.generate(schema)
  end
end
