# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include Faker

Recipe.destroy_all

ingredients = ["Mushrooms",
               "Olives",
               "Cheese",
               "Bacon",
               "Pepperoni",
               "Chicken",
               "Beef",
               "Green Peppers"]


recipe_category = ["Appetizer",
                   "Breakfast",
                   "Lunch",
                   "Chicken",
                   "Dessert",
                   "Healthy",
                   "Main Dish",
                   "Slow Cooker",
                   "Vegetarian"]

50.times do

  recipe = Recipe.create(user_id: User.offset(rand(User.count)).first.id, #gets an actual user_id
                         title: Commerce.product_name,
                         serving_size: Commerce.price.round(0),
                         directions: Lorem.paragraphs(5).join(" "),
                         picture: "http://lorempixel.com/400/200/food",
                         ingredients: ingredients.sort_by { rand }[0..rand(ingredients.length)].join(", "),
                         category: recipe_category[rand(recipe_category.length)],
                         cook_time: Commerce.price.round(0),
                         prepare_time: Commerce.price.round(0),
                         description: Lorem.paragraphs(2).join(" ")

  )
  puts recipe.inspect


  if !recipe.nil?
    (rand(0..5)).times do
      recipe.recipe_comments.create(author: Name.name,
                                    opinion: Lorem.paragraphs(5).join(" "),
                                    rating: rand(1..5),
                                    image: Avatar.image(nil, "200x200"))
    end
  end
end

Product.destroy_all
product_category = ["Cookware",
                    "Bakeware",
                    "Kitchen Tools",
                    "Electrics",
                    "Cutlery",
                    "BBQ & Outdoor",
                    "Tabletop & Serving",
                    "Storage & Cleaning"]

20.times do
  product = Product.create(name: Commerce.product_name.titleize,
                           description: Lorem.paragraphs(5).join(' '),
                           quantity: rand(1..100),
                           price: Commerce.price,
                           cost: Commerce.price,
                           weight: rand(1.5..3),
                           thumbnail: Avatar.image(nil, '50x50'),
                           image: Avatar.image(nil, '150x150'),
                           category: product_category[rand(product_category.length)]

  )
  puts product.inspect
end

Forum.destroy_all
5.times do
  forum = Forum.create(title: Name.title,
                       author: Name.name,
                       content: Lorem.paragraphs(5).join(" ").html_safe,
                       published_date: Time.now,

  )
  forum.save
  if (!forum.nil?)
    3.times do
      forum.comments.create(author: Name.name,
                            content: Lorem.paragraphs(3).join(" ").html_safe,
                            date_published: Time.now,
      )
    end
  end
  puts forum.inspect
end
