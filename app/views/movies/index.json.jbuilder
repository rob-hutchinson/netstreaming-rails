json.array! @movies do |movie|
  json.(movie, :title, :rating, :plot)
end