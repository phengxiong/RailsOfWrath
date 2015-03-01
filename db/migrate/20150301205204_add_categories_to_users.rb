class AddCategoriesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :appetizer, :boolean
    add_column :users, :breakfast, :boolean
    add_column :users, :lunch, :boolean
    add_column :users, :chicken, :boolean
    add_column :users, :dessert, :boolean
    add_column :users, :healthy, :boolean
    add_column :users, :main_dish, :boolean
    add_column :users, :slow_cooker, :boolean
    add_column :users, :vegetarian, :boolean
  end
end
