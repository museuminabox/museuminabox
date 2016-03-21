class AddBrainTypeToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :brain_type, :integer, default: 0
  end
end
