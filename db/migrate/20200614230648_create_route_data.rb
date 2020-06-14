class CreateRouteData < ActiveRecord::Migration[6.0]
  def change
    create_table :route_data do |t|
      t.integer :stop_id
      t.string :stop_name

      t.timestamps
    end
  end
end
