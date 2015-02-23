class Recipe < ActiveRecord::Base
  paginates_per 12
  has_many :recipe_comments, dependent: :destroy
  validates_presence_of :title, :serving_size, :directions, :category, :ingredients, :cook_time, :prepare_time

end
