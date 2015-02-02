json.array!(@recipe_comments) do |recipe_comment|
  json.extract! recipe_comment, :id, :recipe_id, :author, :opinion, :rating
  json.url recipe_comment_url(recipe_comment, format: :json)
end
