class CreateBusRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :bus_routes do |t|
      t.string :route
      t.string :arrival_time
      t.string :bus_distance
      t.string :destination_name
      t.string :last_update

      t.timestamps
    end
  end
end
