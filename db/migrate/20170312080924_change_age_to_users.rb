class ChangeAgeToUsers < ActiveRecord::Migration
  #変更後の型
  def up
    change_column :users, :age, :string
  end

  #変更前の型
  def down
    change_column :users, :age, :integer
  end
end
