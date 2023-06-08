class CreateBees < ActiveRecord::Migration[7.0]
  def change
    create_table :bees do |t|

      t.timestamps null: false
    end
  end
end
