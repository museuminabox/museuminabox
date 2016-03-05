class Collection < ActiveRecord::Base
  has_many :things
  has_many :boxes
end
