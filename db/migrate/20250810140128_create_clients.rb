class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :kyc_status
      t.datetime :kyc_verified_at
      t.string :kyc_reference_id

      t.timestamps
    end
  end
end
