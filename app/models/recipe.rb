class Recipe < ActiveRecord::Base
  paginates_per 12
  has_many :recipe_comments, dependent: :destroy

end
