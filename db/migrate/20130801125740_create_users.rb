class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.integer :id_twitter
      t.string :login_twitter

      t.timestamps
    end
  end
end
