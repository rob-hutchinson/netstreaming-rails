require 'rails_helper'

describe MoviesController do
  render_views


  it "can display a list of films" do
    1.upto 10 do |i|
      FactoryGirl.create :movie, title: "Movie #{i}"
    end

    get :index
    expect(response.code.to_i).to eq 200

    json = response_json
    expect(json.count).to eq 10
    expect(json.last["title"]).to eq "Movie 10"
  end

  it "allows a user to select a film to stream" do
    movie = FactoryGirl.create :movie
    user = FactoryGirl.create :user, age: 30, plan: "gold"

    login user
    post :stream, movie_id: movie.id
    expect(response.code.to_i).to eq 200
    
    json = response_json
    expect(json["title"]).to eq movie.title
  end
  
  it "checks that the user is old enough to watch or stream a film" do
    movie_r = FactoryGirl.create :movie, title: "R Movie", rating: "R"
    movie_g = FactoryGirl.create :movie, title: "G Movie", rating: "G"
    movie_pg13 = FactoryGirl.create :movie, title: "PG-13 Movie", rating: "PG-13"
  
    user_10 = FactoryGirl.create :user, age: 10, plan: "gold"
    user_13 = FactoryGirl.create :user, age: 13, plan: "gold"
    user_17 = FactoryGirl.create :user, age: 17, plan: "gold"

    login user_10
    post :stream, movie_id: movie_r.id
    expect(response.code.to_i).to eq 302
    post :stream, movie_id: movie_pg13.id
    expect(response.code.to_i).to eq 302
    post :stream, movie_id: movie_g.id
    expect(response.code.to_i).to eq 200
    expect(response_json["title"]).to eq "G Movie"
    logout user_10

    login user_13
    post :stream, movie_id: movie_r.id
    expect(response.code.to_i).to eq 302
    post :stream, movie_id: movie_pg13.id
    expect(response.code.to_i).to eq 200
    expect(response_json["title"]).to eq "PG-13 Movie"
    post :stream, movie_id: movie_g.id
    expect(response.code.to_i).to eq 200
    expect(response_json["title"]).to eq "G Movie"
    logout user_13

    login user_17
    post :stream, movie_id: movie_r.id
    expect(response.code.to_i).to eq 200
    expect(response_json["title"]).to eq "R Movie"
    post :stream, movie_id: movie_pg13.id
    expect(response.code.to_i).to eq 200
    expect(response_json["title"]).to eq "PG-13 Movie"
    post :stream, movie_id: movie_g.id
    expect(response.code.to_i).to eq 200
    expect(response_json["title"]).to eq "G Movie"
    
  end


  it "allows a user to check out a film"
  it "allows a user to check in a film"
  it "checks the users plan before checking out films"

end