class Print < ActiveRecord::Base

  belongs_to :thing
  belongs_to :box

  delegate :institution, to: :thing
end
