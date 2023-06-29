class CreateFaqs < ActiveRecord::Migration[7.0]
  def change
    create_table :faqs do |t|
      t.text :schema
      t.text :question
      t.integer :position
      t.index ["id"], name: "index_faqs_on_id", unique: true

      t.timestamps
    end
  end
end
