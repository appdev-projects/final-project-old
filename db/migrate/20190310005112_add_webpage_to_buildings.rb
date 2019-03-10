class AddWebpageToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :webpage, :string
  end
end
