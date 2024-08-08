class AddDetailsToTrailers < ActiveRecord::Migration[7.0]
  def change
    add_column :trailers, :firstname, :string
    add_column :trailers, :lastname, :string
    add_column :trailers, :email, :string
    add_column :trailers, :phone, :string
    add_column :trailers, :date, :datetime
    add_column :trailers, :address1, :string
    add_column :trailers, :address2, :string
    add_column :trailers, :city, :string
    add_column :trailers, :state, :string
    add_column :trailers, :zip, :string
    add_column :trailers, :eventstart, :datetime
    add_column :trailers, :guest, :integer
    add_column :trailers, :detail, :text
  end
end
