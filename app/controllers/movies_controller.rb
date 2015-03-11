class MoviesController < ApplicationController
skip_authorization_check :only => [:index]

  def index
    @movies = Movie.all
  end
end