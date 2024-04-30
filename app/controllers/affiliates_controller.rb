class AffiliatesController < ApplicationController
  layout  "admin"

  before_action :set_affiliate, only: %i[ show edit  destroy ]
  before_action :require_manager

  def index
    @affiliates = Affiliate.all.page(params[:page])
  end
  def show
  end
  def new
    @affiliate = Affiliate.new
  end
  def edit
  end
  def create
    request_data = JSON.parse(request.body.read)
    paytm_number = request_data["paytm_number"]
    puts paytm_number
    app_offer_id = request_data["app_offer_id"]
    app_offer = AppOffer.find(app_offer_id).offer_name
    upi_id = request_data["upi_id"]
    referral_code = session[:referral_code]

    @affiliate = Affiliate.new(
      paytm_number: paytm_number,
      campaign_name: app_offer,
      referral_code: referral_code
    )
    if @affiliate.save
      render json: @affiliate, status: :created
    else
      render json: { errors: @affiliate.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def destroy
    @affiliate.destroy!

      redirect_to affiliates_url, notice: "Affiliate was successfully destroyed."
  end

  private
    def set_affiliate
      @affiliate = Affiliate.find(params[:id])
    end
    def affiliate_params
      params.require(:affiliate).permit(:paytm_number, :campaign_name, :referral_code)
    end
end
