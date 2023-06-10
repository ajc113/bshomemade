class AddImageToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :slug, :string
    add_column :posts, :image, :string
    add_column :posts, :meta_title, :text
    add_column :posts, :meta_description, :text
    add_column :posts, :meta_keywords, :text
  end
end
