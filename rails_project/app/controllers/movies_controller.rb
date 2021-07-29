class MoviesController < ApplicationController

    def new
    end

    def create
        @movie = Movie.new
        @movie.title = params["Title"]
        @movie.save
    end

end
