class CreateRiderRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :rider_routes do |t|
      t.integer :stop_id
      t.string :stop_name
      t.references :rider, null: false, foreign_key: true
      t.references :bus_route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
