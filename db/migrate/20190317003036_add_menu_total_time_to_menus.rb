class AddMenuTotalTimeToMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :menu_total_time, :integer
  end
end
