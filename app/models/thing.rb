class Thing < ActiveRecord::Base

  belongs_to :institution

  has_many :links

  has_many :prints
end
