class MoviesController < ApplicationController
    before_action :authentication_required

    def new
    end

    def create
        @movie = Movie.new
        @movie.title = params["Title"]
        @movie.movie_id = current_user.lists.find(params[:id])
        if @movie.save
            redirect_to '/lists'
        end
    end

end
