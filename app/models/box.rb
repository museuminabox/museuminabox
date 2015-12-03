class Box < ActiveRecord::Base

  belongs_to :museum

  has_many :prints

  def random_print
    unless prints.empty?
      prints[rand(prints.length)]
    else
      nil
    end
  end
end
