class CreateCustomizedPreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :customized_preferences do |t|
      t.integer :event_id
      t.integer :user_id
      t.float :transaction_amount
      t.integer :goal_id

      t.timestamps
    end
  end
end
