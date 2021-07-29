class ListsController < ApplicationController
    before_action :authentication_required

    def new
    end

    def create
        @list = List.new
        @list.title = params['Title']
        @list.user_id = current_user.id
        if @list.save
            redirect_to '/lists'
        else
            render 'lists/new'
        end
    end

    def show
        @list = List.find(params[:id])
    end

    def index
        @lists = List.all
    end

end
