class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.text :name, null: false
      t.text :url, null: false

      t.timestamps null: false
    end
  end
end
