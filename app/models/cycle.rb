class Cycle < ApplicationRecord
  has_many :invitations, dependent: :destroy

  validates_presence_of :name
  validates_associated :invitations
end
