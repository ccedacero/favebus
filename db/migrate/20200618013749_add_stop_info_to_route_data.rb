class AddStopInfoToRouteData < ActiveRecord::Migration[6.0]
  def change
    add_column :route_data, :stop_info, :string
  end
end
