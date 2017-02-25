class AddFreecommentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :freecomment, :string
  end
end
