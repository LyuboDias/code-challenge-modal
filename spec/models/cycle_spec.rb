require 'rails_helper'

RSpec.describe Cycle, type: :model do
  subject(:cycle) { create(:cycle) }

  it { should validate_presence_of (:name) }

  it "expected to return cycle, only if public_status: true" do
    cycle = create(:cycle, public_status: true)
    expect(cycle).to be_public

    cycle = create(:cycle, public_status: false)
    expect(cycle).not_to be_public
  end
end
# git add . && git commit -m "created spec againts the public? method, includes checks for public_status true and false"