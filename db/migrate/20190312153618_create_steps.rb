class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.integer :active
      t.text :equipment_used
      t.string :sequence_number
      t.string :time_length

      t.timestamps
    end
  end
end
