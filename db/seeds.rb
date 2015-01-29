# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


include Faker


puts Name.name
puts Company.bs



Recipe.destroy_all
ingredients = ""
2.times do

  rand(3..9).times do
    ingredients += Lorem.word + " "
  end

  # recipe = Recipe.create(title: Commerce.product_name,
  #                              serving_size: Commerce.price.round(1),
  #                              directions:  Lorem.sentences,
  #                              picture: Avatar.image(nil, "350x350"),
  #                              ingredients: ingredients,
  #                              category: Company.suffix,
  #                              cook_time: Commerce.price.round(1),
  #                              prepare_time: Commerce.price.round(1),
  # )

  recipe = Recipe.create(title: Commerce.product_name,
                         serving_size: Commerce.price.round(0),
                         directions:  Lorem.sentences(sentence_count=3).join(","),
                         picture: Avatar.image(nil, "50x50"),
                         ingredients: ingredients,
                         category: Company.suffix,
                         cook_time: Commerce.price.round(0),
                         prepare_time: Commerce.price.round(0),
  )
  puts recipe.inspect

  # if !product.nil?
  #   (rand(0..5)).times do
  #     product.product_comments.create(author: Name.name,
  #                                     opinion: Company.catch_phrase,
  #                                     rating: rand(1..5))
  #   end

  # end

end