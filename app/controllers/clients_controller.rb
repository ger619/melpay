class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :approve_kyc, :reject_kyc]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: "Client created successfully. KYC status is pending."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client updated."
    else
      render :edit
    end
  end

  def approve_kyc
    @client.update(kyc_status: "approved", kyc_verified_at: Time.current)
    redirect_to @client, notice: "KYC approved."
  end

  def reject_kyc
    @client.update(kyc_status: "rejected")
    redirect_to @client, alert: "Client '#{@client}' KYC rejected."
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :email, :phone)
  end
end
