class AddTwoFactorToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :otp_code, :string
    add_column :users, :otp_sent_at, :datetime
    add_column :users, :phone_number, :string
  end
end
