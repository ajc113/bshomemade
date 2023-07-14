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
    response = UpsertGoogleReviews.new.call

    redirect_to admin_google_reviews_path, notice: response.meta[:message]
  end
end