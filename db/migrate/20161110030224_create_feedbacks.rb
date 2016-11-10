class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.float :rating
      t.references :sender
      t.references :recipient
      t.integer :postId, foreign_key: true

      t.timestamps null: false
    end
    add_index :feedbacks, [:recipient_id, :created_at]
  end
end
