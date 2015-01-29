json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :user_id, :title, :serving_size, :directions, :picture, :ingredients, :category, :cook_time, :prepare_time
  json.url recipe_url(recipe, format: :json)
end
