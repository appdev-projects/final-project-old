class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.integer :block_id
      t.integer :user_id
      t.integer :service_id

      t.timestamps
    end
  end
end
