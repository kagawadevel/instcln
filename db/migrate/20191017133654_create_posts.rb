class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :contet
      t.text :image
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
