class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable, :lockable, :timeoutable, :trackable

  has_many :homes, dependent: :destroy

  def generate_otp!
    self.otp_code = rand(100_000..999_999).to_s
    self.otp_sent_at = Time.current
    save!
  end

  def otp_valid?(code)
    otp_code == code && otp_sent_at > 10.minutes.ago
  end
end
