class ListsController < ApplicationController
    before_action :authentication_required

    def new
    end

    def create
        @list = List.new
        @list.title = params['Title']
        if @list.save
            redirect_to '/lists'
        else
            render 'lists/new'
        end
    end

    def index
        @lists = List.all
    end

end
