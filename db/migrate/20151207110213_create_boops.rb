class CreateBoops < ActiveRecord::Migration
  def change
    create_table :boops do |t|
      t.integer :box_id
      t.integer :print_id

      t.timestamps null: false
    end
    add_index :boops, :box_id
    add_index :boops, :print_id
  end
end
