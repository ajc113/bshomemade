class AddRespondedToToTrailers < ActiveRecord::Migration[7.0]
  def change
    add_column :trailers, :responded_to, :boolean, default: false, null: false
  end
end
