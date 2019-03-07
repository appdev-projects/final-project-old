class CreateCauses < ActiveRecord::Migration[5.1]
  def change
    create_table :causes do |t|
      t.string :description
      t.string :name
      t.string :goal_amount
      t.string :current_amount

      t.timestamps
    end
  end
end
