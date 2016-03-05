class Thing < ActiveRecord::Base

  belongs_to :institution

  belongs_to :collection

  has_many :links

  has_many :prints

  has_many :media
end
