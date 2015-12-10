class Box < ActiveRecord::Base

  belongs_to :collection

  has_many :prints
  has_many :boops

  def random_print
    unless prints.empty?
      prints[rand(prints.length)]
    else
      nil
    end
  end
end
