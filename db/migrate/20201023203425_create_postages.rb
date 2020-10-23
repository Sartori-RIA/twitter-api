class CreatePostages < ActiveRecord::Migration[6.0]
  def change
    create_table :postages do |t|
      t.string :content
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
