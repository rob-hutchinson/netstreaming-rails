class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :age, :plan
  has_many :user_movies
  has_many :movies, through: :user_movies

  def checkout_check plan, rented
    unless plan == "silver" && rented >= 3 || plan == "bronze" && rented >= 1
      true
    end
  end

  def checkout movie
    if checkout_check(plan, currently_rented) && movie.age_check(movie.rating, age)
      self.movies << movie
      self.update currently_rented: self.currently_rented += 1
      true
    end
  end

  def checkin movie
    checked_in_movie = UserMovie.find_by(user_id: self.id, movie_id: movie.id)
    checked_in_movie.delete
    self.update currently_rented: self.currently_rented -= 1
  end
end
