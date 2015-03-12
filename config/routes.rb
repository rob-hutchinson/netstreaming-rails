Rails.application.routes.draw do

  devise_for :users
  
  root to: "movies#index"
 
  post 'movies/:movie_id/stream' => 'movies#stream'
  post 'movies/:movie_id/checkout' => 'movies#checkout'
  post 'movies/:movie_id/checkin' => 'movies#checkin'
end
