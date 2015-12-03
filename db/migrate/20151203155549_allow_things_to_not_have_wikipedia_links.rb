class AllowThingsToNotHaveWikipediaLinks < ActiveRecord::Migration
  def change
    change_column :things, :wikipedia_url, :text, null: true
  end
end
