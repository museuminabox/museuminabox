class ChangeMuseumIdColumn < ActiveRecord::Migration
  def change
		rename_column('boxes', 'museum_id', 'collection_id')
    add_column :things, :collection_id, :integer
  end
end
