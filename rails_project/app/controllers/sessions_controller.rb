class SessionsController < ApplicationController

    def new

    end

    def create
        if auth
            byebug
        else

        end
        #@user = User.find_by(:email => params[:email], :password_digest => params[:password_digest])
        #if @user
            #session[:current_user_id] = @user.id
            #redirect_to '/'
        #else
            #redirect_to '/login', :notice => 'Invalid login'
        #end 
    end

    def destroy
        reset_session
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
