class CreateGeographies < ActiveRecord::Migration[5.1]
  def change
    create_table :geographies do |t|
      t.string :geography

      t.timestamps
    end
  end
end
