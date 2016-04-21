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
  permit_params :thing_id, :box_id, :width_in_m, :height_in_m, :depth_in_m, :print_scale, :image, :image_alt_text, :brain_filename_video, :brain_filename_audio, :brain_url_video, :brain_url_audio

  # Custom bits to live inside the controller for this
  controller do
    before_action :set_s3_direct_post_audio

    # Get our upload URLs in case we want to change the brain video or audio
    def set_s3_direct_post_video
      @s3_direct_post_video = S3_BUCKET.presigned_post(key: "video/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end

    def set_s3_direct_post_audio
      @s3_direct_post_audio = "fred"#+S3_BUCKET.presigned_post(key: "audio/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
  end

  form html: { multipart: true }  do |f|
    f.inputs do
      f.input :thing
      f.input :box
      f.input :width_in_m
      f.input :height_in_m
      f.input :depth_in_m
      f.input :print_scale
      f.input :image
      f.input :image_alt_text
      f.input :brain_url_video
      f.input :brain_url_audio
    end
    f.actions
    # We're going to cheat slightly to add these two new forms after
    # the first one.  (because it's not clear how to cleanly get active_admin
    # to include them otherwise)
    text_node "\n<h3>Upload Media to S3</h3>".html_safe
    text_node "\n<p class='large'>Choosing a file for either of these input entries below will automatically upload it to Amazon S3.  Once the upload is complete, the relevant URL field in the print above will be populated with the uploaded file's URL.  You will still need to click 'Update Print' afterwards to save the URLs in the Print's details.</p>".html_safe
    @s3_direct_post_video = S3_BUCKET.presigned_post(key: "video/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    render partial: "s3_upload", locals: { brain_type: 'video', s3_direct_post: @s3_direct_post_video}
    @s3_direct_post_audio = S3_BUCKET.presigned_post(key: "audio/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    render partial: "s3_upload", locals: { brain_type: 'audio', s3_direct_post: @s3_direct_post_audio}
  end

end
