class AllowObjectsNotToBelongToInstitutions < ActiveRecord::Migration
  def change
    change_column :things, :institution_id, :integer, null: true
  end
end
