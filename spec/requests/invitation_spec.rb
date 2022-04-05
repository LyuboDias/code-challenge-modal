# require 'rails_helper'

# RSpec.describe "Invitations", type: :request do
#   describe 'POST create' do
#     let!(:cycle) { create :cycle, name: 'lorem' }
#     let!(:invitation) { create :invitation, email: 'test@gmail.com', cycle_id: cycle.id, association: cycle }

#     it "opens form modal" do
#       post :create
#       expect(response).to have_http_status(:ok)
#       expect(response.body).to include invitation.email
#     end
#   end

#   describe "responds to" do
#     it "responds to html by default" do
#       post :create, :params => { :cycle => { :name => "lorem" }, :invitation => { :email => "test@gmail.com", cycle_id: cycle.id, :association => cycle } }
#       expect(response.media_type).to eq "text/html"
#     end
#   end
# end


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
