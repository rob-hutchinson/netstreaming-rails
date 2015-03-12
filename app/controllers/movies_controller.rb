class MoviesController < ApplicationController

skip_authorization_check :only => [:index]

  def index
    @movies = Movie.all
  end

  def stream
    authorize! :stream, @movie
    movie = Movie.find(params[:movie_id])

    if movie.age_check(movie.rating, current_user.age) && movie.stream_check(current_user.plan)
      @movie = movie
    else
      flash[:notice] = "You are not allowed to watch this film! Please upgrade your plan or grow up."
      redirect_to ("/")
    end
  end

  def checkout
    authorize! :checkout, @movie
    movie = Movie.find(params[:movie_id])
    if current_user.checkout movie
      @movie = movie
    else
      flash[:notice] = "You are not allowed to rent this film!"
      redirect_to ("/")
    end
  end

  def checkin
    authorize! :checkin, @movie
    movie = Movie.find(params[:movie_id])
    current_user.checkin movie
    head :ok
  end
end