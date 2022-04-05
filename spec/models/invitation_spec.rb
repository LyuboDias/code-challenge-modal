require 'rails_helper'

RSpec.describe Invitation, type: :model do
    subject(:invitation) { create(:invitation) }

    it "has a valid factory" do
        expect(invitation).to be_valid
    end

    describe "Associations" do
        it { should belong_to(:cycle) }
    end

    it { should validate_presence_of (:email) }
end
