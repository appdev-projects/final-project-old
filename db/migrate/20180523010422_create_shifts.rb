class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.integer :user_id
      t.integer :service_id
      t.datetime :date
      t.boolean :night

      t.timestamps
    end
  end
end
