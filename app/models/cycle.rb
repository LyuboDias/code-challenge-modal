class Cycle < ApplicationRecord
  validates_presence_of :name

  def public?
    !(piblic_status: true)
  end
  
end
