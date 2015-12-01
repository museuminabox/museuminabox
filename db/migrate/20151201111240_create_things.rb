class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.integer :institution_id, null: false
      t.text :name, null: false
      t.text :creators, array: true, null: false, default: []
      t.text :description, null: false
      t.text :description_attribution_url, null: false
      t.text :wikipedia_url, null: false
      t.text :tags, array: true, null: false, default: []
      t.boolean :three_dimensions, null: false, default: true

      t.timestamps null: false
    end
  end
end
