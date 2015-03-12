class Movie < ActiveRecord::Base

  validates_presence_of :title, :rating, :plot
  validates_uniqueness_of :title
  
  belongs_to :users

  def age_check rating, age
    if rating == "R" && age < 17
      false
    elsif rating == "PG-13" && age < 13
      false
    else
      true
    end
  end
end
