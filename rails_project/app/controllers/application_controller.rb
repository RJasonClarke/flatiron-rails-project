class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect
        if !logged_in?
            redirect_to root_path
        end
    end

end
