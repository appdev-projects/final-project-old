class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.boolean :crosscover
      t.boolean :vacation

      t.timestamps
    end
  end
end
