class CreateFlavors < ActiveRecord::Migration[7.0]
  def change
    create_table :flavors do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
