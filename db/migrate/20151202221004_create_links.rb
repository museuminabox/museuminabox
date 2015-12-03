class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :thing_id, null: false
      t.text :url, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
