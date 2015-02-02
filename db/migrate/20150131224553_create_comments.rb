class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.datetime :date_published
      t.belongs_to :forum, index: true

      t.timestamps
    end
  end
end
