class Account < ApplicationRecord
  belongs_to :client

  validate :client_must_have_approved_kyc

  private

  def client_must_have_approved_kyc
    errors.add(:base, "KYC must be approved before creating an account") unless client&.kyc_approved?
  end
end
