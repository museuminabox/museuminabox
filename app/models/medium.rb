class Medium < ActiveRecord::Base
  validates :thing_id, presence: true
  validates :media_type, presence: true
  validates :link_or_embed, presence: true
  belongs_to :thing
end
