class AddNumberToBlock < ActiveRecord::Migration[5.1]
  def change
    add_column :blocks, :number, :integer
  end
end
