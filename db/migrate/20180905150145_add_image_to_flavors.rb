class AddImageToFlavors < ActiveRecord::Migration[7.0]
  def change
    add_column :flavors, :availability, :string
    add_column :flavors, :flavorofweek, :string
    add_column :flavors, :image, :string
  end
end
