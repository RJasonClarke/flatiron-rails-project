class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id #helps app remember user is logged in
            redirect_to user_path(user)
        else
            flash[:message] = 'Invalid login'
            redirect_to '/login'
        end
    end

    def omniauth
        @user = User.find_or_create_by(email: auth['info']['email']) do |user|
            user.password = SecureRandom.hex
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

    private

    #used to get info about google account
    def auth
        request.env['omniauth.auth']
    end

end
