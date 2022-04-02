require 'rails_helper'

RSpec.describe Cycle, type: :model do
  subject(:cycle) { create(:cycle) }

  it { should validate_presence_of (:name) }

  # it "returns cycle, if public_status: true" 
  #   # cycle = build(:cycle, public_status: true)
  #   expect(cycle).to be_public
  # end

  # it "returns cycle, if public_status: false" 
  #   # cycle = build(:cycle, public_status: false)
  #   expect(cycle).not_to be_public
  # end
  # TODO spec if method returns only cycles with public_status: true, so index method in controller will have only public cycles
end
