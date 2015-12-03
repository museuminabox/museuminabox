class AddAltTextToThing < ActiveRecord::Migration
  def change
    add_column :things, :image_alt_text, :text
  end
end
