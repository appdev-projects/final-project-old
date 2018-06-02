class ChangeVacReqApprovalType < ActiveRecord::Migration[5.1]
  def change
    change_column :vac_reqs, :approval, :string
  end
end
