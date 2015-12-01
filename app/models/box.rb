class Box < ActiveRecord::Base

  belongs_to :museum

  has_many :prints

end
