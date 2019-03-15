class CreateMenuSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_steps do |t|
      t.integer :step_id
      t.integer :menu_appearance_id

      t.timestamps
    end
  end
end
