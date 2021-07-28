class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :current_user

    def home
    end

end
