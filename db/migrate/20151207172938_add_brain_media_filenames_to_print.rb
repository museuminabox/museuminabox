class AddBrainMediaFilenamesToPrint < ActiveRecord::Migration
  def change
    add_column :prints, :brain_filename_video, :text
    add_column :prints, :brain_filename_audio, :text
  end
end
