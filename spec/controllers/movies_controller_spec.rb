require 'rails_helper'

describe MoviesController do
  render_views


  it "can display a list of films" do
    1.upto 10 do |i|
      FactoryGirl.create :movie, title: "Movie #{i}"
    end

    get :index

    expect(response.code.to_i).to eq 200

    json = JSON.parse(response.body)
    expect(json.count).to eq 10
    expect(json.last["title"]).to eq "Movie 10"
  end

  it "allows a user to select a film to stream"
  it "allows a user to check out a film"
  it "allows a user to check in a film"
  it "checks that the user is old enough to watch a film"
  it "checks the users plan before doing the action"

end