# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include Faker

Recipe.destroy_all

ingredients = ['"mushrooms", "olives", "cheese"']

5.times do
  recipe = Recipe.create(user_id: rand(0..100),
                         title: Commerce.product_name,
                         serving_size: Commerce.price.round(0),
                         directions: Lorem.sentences(sentence_count=3).join(','),
                         picture: Avatar.image(nil, '50x50'),
                         ingredients: ingredients[rand(0..2)],
                         category: Company.suffix,
                         cook_time: Commerce.price.round(0),
                         prepare_time: Commerce.price.round(0),

  )
  puts recipe.inspect
end

# if !product.nil?
#   (rand(0..5)).times do
#     product.product_comments.create(author: Name.name,
#                                     opinion: Company.catch_phrase,
#                                     rating: rand(1..5))
#   end
# end

Product.destroy_all

5.times do
  product = Product.create(name: Commerce.product_name.titleize,
                           description: Lorem.paragraphs(5).join(' '),
                           quantity: rand(1..100),
                           price: Commerce.price,
                           cost: Commerce.price,
                           weight: rand(1.5..3),
                           thumbnail: Avatar.image(nil, '50x50'),
                           image: Avatar.image(nil, '150x150'),

  )
  puts product.inspect

end
