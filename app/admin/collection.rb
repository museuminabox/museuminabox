ActiveAdmin.register Collection do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  permit_params :name, :private

  show do
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
      row :private
    end
    panel "Things" do
      table_for collection.things do
        column "Thing ID" do |thing|
          link_to thing.id, admin_thing_path(thing.id)
        end
        column "Image" do |thing|
          link_to image_tag(thing.image, :width => 80), admin_thing_path(thing.id)
        end
        column "Name" do |thing|
          link_to thing.name, admin_thing_path(thing.id)
        end
        column :description
      end
    end
    panel "Boxes" do
      table_for collection.boxes do
        column "Box ID" do |box|
          link_to box.id, admin_box_path(box.id)
        end
        column :created_at
        column :updated_at
      end
    end
  end

end
