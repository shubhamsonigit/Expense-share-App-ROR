class CreateAudits < ActiveRecord::Migration[7.0]
  def change
    create_table :audits do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :user_id2
      t.references :group, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
