class Print < ActiveRecord::Base

  belongs_to :thing
  belongs_to :box
  has_many :boops

  delegate :institution, to: :thing
end
