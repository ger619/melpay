class TwoFactorController < ApplicationController
  before_action :authenticate_user!

  def send_otp
    current_user.generate_otp!
    # For Emails
    UserMailer.with(user: current_user).send_otp.deliver_later

    # For SMS

    SmsSender.send_otp(current_user.phone_number, current_user.otp)

    redirect_to verify_otp_path, notice: 'OTP sent.'
  end

  def verify; end

  def check
    if current_user.otp_valid?(params[:otp_code])
      session[:two_factor_authenticated] = true
      redirect_to root_path, notice: 'OTP verified.'
    else
      flash.now[:alert] = 'Invalid OTP.'
      render :verify
    end
  end
end
