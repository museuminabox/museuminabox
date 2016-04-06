class Institution < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true

  has_many :things
end
