class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :airport
      t.string :terminal
      t.text :location
      t.text :purpose
      t.text :company
      t.string :destination
      t.string :flightdate
      t.string :flighttime
      t.text :latestcomment

      t.timestamps null: false
    end
  end
end
