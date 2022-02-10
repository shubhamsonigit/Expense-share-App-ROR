class AddUserIdToAudits < ActiveRecord::Migration[7.0]
  def change
    add_column :audits, :user_id2, :integer
  end
end
