class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.string :name
      t.integer :servings
      t.time :target_completion_time
      t.text :description

      t.timestamps
    end
  end
end
