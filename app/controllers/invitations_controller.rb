class InvitationsController < ApplicationController
    before_action :extract_name, only: [:create]

    def new
        @cycle = Cycle.find(params[:cycle_id])
        @invitation = Invitation.new
        respond_to do |format|
            format.html
            format.js
        end
    end

    def create
        @invitation = Invitation.new(invitee: @name, message: invitation_params[:message], email: invitation_params[:email])
        @invitation.cycle_id = (params[:cycle_id])
        # if invitation is valid and saved -> redirect home
        if @invitation.save!
            flash[:success] = 'Invitation created successfully'
            redirect_to root_path
        else
            render :new
        end
    end

    def extract_name
        @name = invitation_params[:email].split('@')[0].gsub('.', ' ').titleize
    end
    

    private
    
    def invitation_params
        params.require(:invitation).permit(:email, :message)
    end
end
