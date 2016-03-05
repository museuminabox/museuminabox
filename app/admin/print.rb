ActiveAdmin.register Print do

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
  permit_params :thing_id, :box_id, :width_in_m, :height_in_m, :depth_in_m, :print_scale, :image, :image_alt_text, :brain_filename_video, :brain_filename_audio


end
