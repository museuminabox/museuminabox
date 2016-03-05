ActiveAdmin.register Thing do

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
  permit_params :institution_id, :collection_id, :name, :creators, :description, :description_attribution_url, :wikipedia_url, :tags, :three_dimensions, :lat, :long, :image, :image_alt_text

  index do
    selectable_column
    column :id
    column :name
    column :description
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row "Image" do |thing|
        image_tag(thing.image, :width => 160)
      end
      row :created_at
      row :updated_at
      row :collection_id
    end
    panel "Prints" do
      table_for thing.prints do
        column "ID" do |print|
          link_to print.id, admin_print_path(print.id)
        end
        column "Image" do |print|
          link_to image_tag(print.image, :width => 80), admin_print_path(print.id)
        end
        column :image_alt_text
      end
    end
  end

end
