class AddColumnToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :file, :string
  end
end
