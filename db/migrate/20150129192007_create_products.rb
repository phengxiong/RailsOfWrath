class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.float :price
      t.float :cost
      t.float :weight
      t.string :thumbnail
      t.string :image

      t.timestamps
    end
  end
end
