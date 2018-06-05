class CreateVacReqs < ActiveRecord::Migration[5.1]
  def change
    create_table :vac_reqs do |t|
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :approval

      t.timestamps
    end
  end
end
