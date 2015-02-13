class AddSharedToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :shared, :integer
  end
end
