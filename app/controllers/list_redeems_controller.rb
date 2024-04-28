class ListRedeemsController < ApplicationController
  layout "admin"
  before_action :require_manager
  before_action :set_app_redeem, only: [:show, :edit, :update,:payout]

  def index
    if params[:paytm_number].present?
      @app_redeems = AppRedeem.where("pay_phone LIKE ?", "%#{params[:paytm_number]}%").order("created_at DESC")
    else
      @app_redeems = AppRedeem.all.order("created_at DESC")
    end
  end

  def show
  end

  def edit
  end

  def update
    if @app_redeem.update(app_redeem_params)
      redirect_to admin_app_redeems_path, notice: "Updated Successfully"
    else
      redirect_to admin_app_redeems_path, notice: "Something Went Wrong"
    end
  end

  def payout
    @user = RefUser.find_by(email: params[:email]) 
    payload = {
      "account_number": "2323230032548212",
      "amount": params[:amount] + "00",
      "currency": "INR",
      "mode": "UPI",
      "purpose": "payout",
      "notes": { "message": params[:message] },
      "fund_account": {
        "account_type": 'vpa',
        "vpa": { "address": params[:upi_id] },
        "contact": {
          "name": @user.name,
          "email": params[:email],
          "contact": params[:phone],
          "type": 'customer',
          "reference_id": "app-redeemid:#{params[:id]}",
        }
      }
    }
    if params[:secret] == "5555"
      response = RestClient.post("https://api.razorpay.com/v1/payouts", payload, 
      { 
        Authorization: "Basic #{Base64.strict_encode64('rzp_test_7diTCOApnFoVCf:LYLkB3wC27KuFZNYqFg6eqhS')}",
        accept: "application/json" 
      })
      @app_redeem.update(status: "PROCESSED")
      redirect_to admin_app_redeems_path, notice: "Payout Successful!!"
    else
      redirect_to admin_app_redeems_path, alert: "Invalid Secret Code"
    end
  rescue RestClient::ExceptionWithResponse => e
    puts "Error: #{e.response}"
  end

  private

  def set_app_redeem
    @app_redeem = AppRedeem.find(params[:id])
  end

  def app_redeem_params
    params.require(:app_redeem).permit(:ref_user_id, :pay_phone, :pay_email, :pay_type, :pay_vendor, :upi_id, :pay_coin, :pay_amount, :status)
  end
end
