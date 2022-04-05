class InvitationsController < ApplicationController
    before_action :extract_name, :extract_email, only: [:create]

    def new
        @cycle = Cycle.find(params[:cycle_id])
        @invitation = Invitation.new
        respond_to do |format|
            format.html
            format.js
        end
    end

    def create
        @invitation = Invitation.new(invitee: @name, message: invitation_params[:message], email: @email)
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
        if invitation_params[:email].include?('<')
            # split on < and capitalize
            @name = invitation_params[:email].split('<')[0].titleize
        else
            # split email at @ to get the name like so: lyubo.dias => swap . with ' ' white space and capitalize every word in the string
            @name = invitation_params[:email].split('@')[0].gsub('.', ' ').titleize
        end
    end

    def extract_email
        if invitation_params[:email].include?('<')
            # split on < and remove last char >
            @email = invitation_params[:email].split('<')[1].chop
        end
    end

    private
    
    def invitation_params
        params.require(:invitation).permit(:email, :message)
    end
end
