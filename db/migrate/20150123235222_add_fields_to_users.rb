class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :newsletter, :boolean
    add_column :users, :vip, :boolean
    add_column :users, :admin, :boolean
  end
end
