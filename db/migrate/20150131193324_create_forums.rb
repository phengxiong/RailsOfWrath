class CreateForums < ActiveRecord::Migration

  def change
    create_table :forums do |t|
      t.integer :forum_id
      t.string :author
      t.string :title
      t.text :content
      t.datetime :published_date

      t.timestamps
    end
  end
end
