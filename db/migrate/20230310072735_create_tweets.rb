class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :content, null: false
      # t.string :content_image, null: false
      t.integer "user_id"

      t.timestamps
    end
  end
end
