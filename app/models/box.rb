class Box < ActiveRecord::Base

  enum brain_type: [ :audio, :video ]

  validates :collection_id, presence: true

  belongs_to :collection

  has_many :prints
  has_many :boops

  def name
    "Box ##{id} - #{collection.name}"
  end

  def random_print
    unless prints.empty?
      prints[rand(prints.length)]
    else
      nil
    end
  end
end
