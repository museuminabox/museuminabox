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
end
