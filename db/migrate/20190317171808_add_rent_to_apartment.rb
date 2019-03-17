class AddRentToApartment < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :rent, :integer
  end
end
