class AddPrivateToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :private, :boolean, default: false
  end
end
