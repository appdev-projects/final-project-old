class AddDescriptionToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :steps, :description, :text
  end
end
