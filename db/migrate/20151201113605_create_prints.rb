class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.integer :thing_id, null: false
      t.integer :box_id, null: false
      t.float :width_in_m, null: false
      t.float :height_in_m, null: false
      t.float :depth_in_m, null: false
      t.float :print_scale, null: false

      t.timestamps null: false
    end
  end
end
