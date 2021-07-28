class UsersController < ApplicationController

    def new

    end

    def create
        @user = User.new
        @user.email = params[:email]
        @user.password_digest = params[:password_digest]
        if @user.save
            redirect_to '/'
        else
            render '/register'
        end
    end

end
