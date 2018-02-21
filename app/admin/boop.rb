ActiveAdmin.register Boop do

  index do
    column :id
    column "Box" do |boop|
      link_to boop.box.id, admin_collection_path(boop.box_id)
    end
    column "Print" do |boop|
      link_to boop.print.id, admin_collection_path(boop.print_id)
    end
    column :created_at
    column :updated_at
    actions
  end

end
