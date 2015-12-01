class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :museum_id, null: false

      t.timestamps null: false
    end
  end
end
