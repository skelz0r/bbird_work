class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.text :content
      t.integer :id_case
      t.integer :canvas_id
      t.timestamps
    end
  end
end
