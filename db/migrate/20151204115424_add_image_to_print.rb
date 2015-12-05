class AddImageToPrint < ActiveRecord::Migration
  def change
    add_column :prints, :image, :text
    add_column :prints, :image_alt_text, :text
  end
end
