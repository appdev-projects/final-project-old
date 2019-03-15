class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :number_served
      t.integer :user_id
      t.text :description
      t.string :total_time

      t.timestamps
    end
  end
end
