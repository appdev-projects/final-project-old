class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
