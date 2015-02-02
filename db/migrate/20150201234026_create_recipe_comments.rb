class CreateRecipeComments < ActiveRecord::Migration
  def change
    create_table :recipe_comments do |t|
      t.integer :recipe_id
      t.string :author
      t.text :opinion
      t.integer :rating

      t.timestamps
    end
  end
end
