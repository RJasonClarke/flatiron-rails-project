class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(:email => params[:email], :password_digest => params[:password_digest])
        if @user
            raise 'login'.inspect
        else
            redirect_to '/login', :notice => 'Invalid login'
        end 
    end

end
