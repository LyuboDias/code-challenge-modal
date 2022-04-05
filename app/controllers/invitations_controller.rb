class InvitationsController < ApplicationController

    def new
        @cycle = Cycle.find(params[:cycle_id])
        @invitation = Invitation.new
        respond_to do |format|
            format.html
            format.js
        end
    end

    def create
        @invitation = Invitation.new(invitation_params)
        @invitation.cycle_id = (params[:cycle_id])
        # if invitation is valid and saved -> redirect home
        if @invitation.save!
            flash[:success] = 'Invitation created successfully'
            redirect_to root_path
        else
            render :new
        end
    end

    private
    
    def invitation_params
        params.require(:invitation).permit(:email, :message)
    end
end
