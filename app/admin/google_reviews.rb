ActiveAdmin.register GoogleReview do
  actions :index

  action_item :upsert_reviews, only: :index do
    link_to 'Import Reviews', upsert_reviews_admin_google_reviews_path, method: :post
  end

  index do
    column :text
    column :time
    column :rating
    column :language
    column :author_url
    column :translated
    column :author_name
    column :original_language
    column :profile_photo_url
    column :relative_time_description
  end

  collection_action :upsert_reviews, method: :post do
    place_id = Rails.application.credentials.google_place_id
    api_key = Rails.application.credentials.google_place_api_key
    reviews = GoogleReviews::Reviews.fetch_reviews_by_place_id(api_key, place_id)

    upsert_records = reviews.map do |review|
      {
        author_name: review[:author_name],
        text: review[:text],
        time: review[:time],
        rating: review[:rating],
        language: review[:language],
        author_url: review[:author_url],
        translated: review[:translated],
        original_language: review[:original_language],
        profile_photo_url: review[:profile_photo_url],
        relative_time_description: review[:relative_time_description]
      }
    end

    GoogleReview.upsert_all(upsert_records, unique_by: :author_name)

    redirect_to admin_google_reviews_path, notice: 'Reviews imported successfully.'
  end
end