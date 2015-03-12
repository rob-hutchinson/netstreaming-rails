class MoviesController < ApplicationController

skip_authorization_check :only => [:index]

  def index
    @movies = Movie.all
  end

  def stream
    authorize! :stream, @movie
    movie = Movie.find(params[:movie_id])

    if movie.age_check movie.rating, current_user.age
      @movie = movie
    else
      flash[:notice] = "You are too young to view this film!"
      redirect_to root_url
    end
  end
end