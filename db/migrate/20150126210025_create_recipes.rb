class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :title
      t.string :serving_size
      t.string :directions
      t.string :picture
      t.text :ingredients
      t.string :category
      t.string :cook_time
      t.string :prepare_time

      t.timestamps
    end
  end
end
