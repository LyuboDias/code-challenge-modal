require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do

  describe 'GET create' do
    let!(:cycle) { create(:cycle) }
    let!(:invitation) { create(:invitation, email: 'test@gmail.com', cycle_id: cycle.id) }

    it "flash message if create successfull" do
      post :create, params: { cycle_id: cycle.id, invitation: { email: invitation.email, message: 'testmessage' }}
      expect(flash[:success]).to be_present
      expect(response.status).to eq(302)
    end
  end
end
