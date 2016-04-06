class Link < ActiveRecord::Base
  validates :thing_id, presence: true
  validates :url, presence: true
  belongs_to :thing
end
