class AddYearToBlock < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :year, :integer
  end
end
