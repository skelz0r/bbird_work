class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :author
      t.string :text
      t.integer :id_twitter

      t.timestamps
    end
  end
end
