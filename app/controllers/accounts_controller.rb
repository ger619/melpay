class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client
  before_action :check_kyc_status

  def index
    @accounts = @client.accounts
  end

  def new
    @account = @client.accounts.build
  end

  def create
    @account = @client.accounts.build(account_params)
    if @account.save
      redirect_to client_path(@client), notice: "Account created successfully for #{@client}."
    else
      render :new
    end
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def account_params
    params.require(:account).permit(:account_number, :account_type, :balance)
  end

  def check_kyc_status
    return if @client.kyc_approved?

    redirect_to @client, alert: "KYC must be approved before creating an account for #{@client}."
  end
end
