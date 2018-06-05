class AddSeniorityToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :seniority, :string
  end
end
