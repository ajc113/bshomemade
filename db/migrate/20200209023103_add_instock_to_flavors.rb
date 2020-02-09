class AddInstockToFlavors < ActiveRecord::Migration
  def change
    add_column :flavors, :instock, :string
  end
end
