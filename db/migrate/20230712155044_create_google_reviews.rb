class CreateGoogleReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :google_reviews do |t|
      t.text :text
      t.bigint :time
      t.integer :rating
      t.string :language
      t.string :author_url
      t.boolean :translated
      t.string :author_name
      t.string :original_language
      t.string :profile_photo_url
      t.string :relative_time_description
      t.index :author_name, unique: true

      t.timestamps
    end
  end
end
