class CreateActiveAdminComments < ActiveRecord::Migration[7.0]
  def self.up
    create_table :active_admin_comments do |t|
      t.string :namespace
      t.text   :body
      t.references :resource, polymorphic: true
      t.references :author, polymorphic: true
      t.timestamps null: false
    end
    add_index :active_admin_comments, [:namespace]

    add_index :active_admin_comments, [:author_type, :author_id]
    add_index :active_admin_comments, [:resource_type, :resource_id]

  end

  def self.down
    drop_table :active_admin_comments
  end
end
