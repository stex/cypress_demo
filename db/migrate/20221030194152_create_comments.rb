class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.belongs_to :account
      t.text :content
      t.timestamps
    end
  end
end
