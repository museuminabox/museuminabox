ActiveAdmin.register Box do

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
  permit_params :collection_id

  index do
    column :id
    column :created_at
    column :updated_at
    column "Collection" do |box|
      link_to box.collection.name, admin_collection_path(box.collection_id)
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :collection_id
      row :created_at
      row :updated_at
    end
    panel "Contents" do
      table_for box.collection.things do |thing|
        column "Object ID" do |t|
          link_to t.id, admin_thing_path(t.id)
        end
        column "Object Image" do |t|
          link_to image_tag(t.image, :width => 80), admin_thing_path(t.id)
        end
        column "Name", :name
        column :description
        print = box.prints.where(:thing_id == thing.id)[0]
        unless print.nil?
          column "Print ID" do
            link_to print.id, admin_print_path(print.id)
          end
          column "Print Image" do
            link_to image_tag(print.image, :width => 80), admin_print_path(print.id)
          end
        end
      end
    end
  end

end
