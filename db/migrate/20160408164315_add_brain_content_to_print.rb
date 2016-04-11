class AddBrainContentToPrint < ActiveRecord::Migration
  def change
    add_column :prints, :brain_url_video, :string
    add_column :prints, :brain_url_audio, :string
  end
end
