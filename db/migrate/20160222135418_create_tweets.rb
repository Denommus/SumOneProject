class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user
      t.text :text

      t.timestamps null: false
    end
  end
end
