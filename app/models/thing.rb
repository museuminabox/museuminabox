class Thing < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :description_attribution_url, presence: true

  belongs_to :institution

  belongs_to :collection

  has_many :links

  has_many :prints

  has_many :media
end
