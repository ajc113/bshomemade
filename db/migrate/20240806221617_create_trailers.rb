class CreateTrailers < ActiveRecord::Migration[7.0]
  def change
    create_table :trailers do |t|

      t.timestamps
    end
  end
end
