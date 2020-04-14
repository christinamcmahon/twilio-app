class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :date_time
      t.string :content
      t.string :img
      t.integer :user_id
      t.string :type
      t.integer :likes

      t.timestamps
    end
  end
end
