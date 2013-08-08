class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.text :content
      t.integer :id_case

      t.timestamps
    end
  end
end
