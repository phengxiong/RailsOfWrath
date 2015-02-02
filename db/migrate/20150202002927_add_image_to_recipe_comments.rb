class AddImageToRecipeComments < ActiveRecord::Migration
  def change
    add_column :recipe_comments, :image, :string
  end
end
