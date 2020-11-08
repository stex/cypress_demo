class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :liking_user
      t.references :liked_post
      t.timestamps
    end
  end
end
