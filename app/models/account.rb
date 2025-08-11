class Account < ApplicationRecord
  belongs_to :client

  validate :client_must_have_approved_kyc

  before_create :assign_account_number

  private

  def client_must_have_approved_kyc
    errors.add(:base, 'KYC must be approved before creating an account') unless client&.kyc_approved?
  end

  def assign_account_number
    last_account = Account.order(:created_at).last
    last_number = if last_account&.account_number&.match?(/^mlpacc-(\d+)$/)
                    last_account.account_number.split('-').last.to_i
                  else
                    0
                  end
    self.account_number = "mlpacc-#{last_number + 1}"
  end
end
