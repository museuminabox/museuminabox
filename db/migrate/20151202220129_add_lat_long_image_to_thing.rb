class AddLatLongImageToThing < ActiveRecord::Migration
  def change
    add_column :things, :lat, :float
    add_column :things, :long, :float
    add_column :things, :image, :text
  end
end
