class CreateMenuAppearances < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_appearances do |t|
      t.integer :recipe_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
