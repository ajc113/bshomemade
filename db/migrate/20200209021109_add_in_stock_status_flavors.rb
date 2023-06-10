class AddInStockStatusFlavors < ActiveRecord::Migration[7.0]
  def change
    add_column :flavors, :instock, :string
  end
end
