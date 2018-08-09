class CreateBees < ActiveRecord::Migration
  def change
    create_table :bees do |t|

      t.timestamps null: false
    end
  end
end
