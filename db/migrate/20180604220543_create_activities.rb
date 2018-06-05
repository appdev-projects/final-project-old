class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :activity
      t.string :category

      t.timestamps
    end
  end
end
