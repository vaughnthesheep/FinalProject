class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :artist_id
      t.string :name
      t.string :image
      t.decimal :price

      t.timestamps
    end
  end
end
