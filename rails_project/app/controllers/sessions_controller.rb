class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(:email => params[:email], :password_digest => params[:password_digest])
        if @user
            session[:current_user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/login', :notice => 'Invalid login'
        end 
    end

    def destroy
        reset_session
        redirect_to '/'
    end

end
