class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :fname
      t.string :lname
      t.string :email

      t.timestamps null: false
    end
  end
end
