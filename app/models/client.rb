class Client < ApplicationRecord
  has_many :accounts, dependent: :destroy

  STATUSES = %w[pending approved rejected].freeze

  validates :name, :email, presence: true
  validates :kyc_status, inclusion: { in: STATUSES }

  before_validation :set_default_kyc_status, on: :create

  def kyc_approved?
    kyc_status == "approved"
  end

  private

  def set_default_kyc_status
    self.kyc_status ||= "pending"
  end
end
