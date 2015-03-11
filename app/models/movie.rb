class Movie < ActiveRecord::Base

  validates_presence_of :title, :rating, :plot
  validates_uniqueness_of :title
  
  belongs_to :users
end
