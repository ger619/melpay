class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :account_number
      t.string :account_type
      t.decimal :balance
      t.references :client, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
