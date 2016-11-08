class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.float :price
      t.text :courseName
      t.text :courseCode
      t.text :department
      t.text :descrition

      t.timestamps null: false
    end
    
    add_index :posts, [:user_id, :created_at]
    
  end
end
