class Movie < ActiveRecord::Base
  validates_presence_of :title, :rating, :plot

  belongs_to :users
end
