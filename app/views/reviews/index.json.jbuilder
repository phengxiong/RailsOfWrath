json.array!(@reviews) do |review|
  json.extract! review, :id, :author, :comment, :rating
  json.url review_url(review, format: :json)
end
