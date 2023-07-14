class UpsertGoogleReviews
  def call
    place_id = Rails.application.credentials.google_place_id
    api_key = Rails.application.credentials.google_place_api_key

    response = GoogleReviews::Reviews.fetch_reviews_by_place_id(api_key, place_id)

    if response.success?
      import_reviews(response.data)
    else
      ServiceResponse.new(status: response.status, meta: { message: response.error })
    end
  end

  private

  def import_reviews(reviews)
    return ServiceResponse.new unless reviews

    begin
      records = upsert_records(reviews)
      GoogleReview.upsert_all(records, unique_by: :author_name)

      ServiceResponse.new(meta: { message: "Reviews imported successfully" })
    rescue StandardError => exception
      message = "Error while importing reviews #{exception}"

      ServiceResponse.new(status: 409, meta: { message: message })
    end
  end

  def upsert_records(reviews)
    reviews.map do |review|
      {
        author_name: review.author_name,
        text: review.text,
        time: review.time,
        rating: review.rating,
        language: review.language,
        author_url: review.author_url,
        translated: review.translated,
        original_language: review.original_language,
        profile_photo_url: review.profile_photo_url,
        relative_time_description: review.relative_time_description
      }
    end
  end
end
