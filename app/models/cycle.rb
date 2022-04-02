class Cycle < ApplicationRecord
  validates_presence_of :name

  def public?
    self.public_status === true
  end
end
