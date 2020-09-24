class CreateComicbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :comicbooks do |t|
      t.string :title
      t.integer :number
      t.string :writer
      t.string :artist
      t.string :publisher
      t.integer :user_id

      t.timestamps
    end
  end
end
