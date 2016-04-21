class Print < ActiveRecord::Base

  validates :thing_id, presence: true
  validates :box_id, presence: true
  validates :width_in_m, presence: true
  validates :height_in_m, presence: true
  validates :depth_in_m, presence: true
  validates :print_scale, presence: true

  belongs_to :thing
  belongs_to :box
  has_many :boops

  delegate :institution, to: :thing

  # Setting either of the media URLs should update the filename attribute

  def brain_url_video=(new_url)
    # Set it
    write_attribute(:brain_url_video, new_url)
    # And update the filename attribute
    self.brain_filename_video = File.basename(URI::parse(new_url).path)
  end

  def brain_url_audio=(new_url)
    # Set it
    write_attribute(:brain_url_audio, new_url)
    # And update the filename attribute
    self.brain_filename_audio = File.basename(URI::parse(new_url).path)
  end
end
