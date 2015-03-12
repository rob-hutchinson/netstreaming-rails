class Movie < ActiveRecord::Base

  validates_presence_of :title, :rating, :plot
  validates_uniqueness_of :title
  
  has_many :user_movies
  has_many :users, through: :user_movies

  def age_check rating, age
    if rating == "R" && age < 17
      false
    elsif rating == "NC-17" && age < 17
      false
    elsif rating == "PG-13" && age < 13
      false
    else
      true
    end
  end

  def stream_check plan
    unless plan == "bronze"
      true
    end
  end

  
end
