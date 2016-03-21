class Box < ActiveRecord::Base

  enum brain_type: [ :audio, :video ]

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
