class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :description
      t.string :name
      t.boolean :d_or_s
      t.string :goal_amount
      t.string :current_amount
      t.date :deadline

      t.timestamps
    end
  end
end
