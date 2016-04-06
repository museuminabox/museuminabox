class Collection < ActiveRecord::Base

  validates :name, presence: true

  has_many :things
  has_many :boxes
end
