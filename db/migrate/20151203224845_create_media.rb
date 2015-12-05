class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :thing_id, null: false
      t.integer :media_type, null: false
      t.text :link_or_embed, null: false
      t.text :attribution

      t.timestamps null: false
    end
  end
end
