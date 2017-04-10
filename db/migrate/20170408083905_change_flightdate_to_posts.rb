class ChangeFlightdateToPosts < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.change :flightdate, 'date USING CAST(flightdate AS date)'
    end
  end

  def down
    change_table :posts do |t|
      t.change :flightdate, :string
    end
  end
end
