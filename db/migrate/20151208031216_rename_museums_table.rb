class RenameMuseumsTable < ActiveRecord::Migration
  def change
		rename_table('museums', 'collections')
  end
end
