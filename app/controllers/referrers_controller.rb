class ReferrersController < ApplicationController

  layout  "admin"

  before_action :set_referrer, only: %i[ show edit update]

  def index
    @referrers = Referrer.all
    @app_offers = AppOffer
  end

  def show
  end

  def new
    @referrer = Referrer.new
  end

  def edit
  end

  def create
    @referrer = Referrer.new(referrer_params)
    @app_offer_id = params[:app_offer_id]
    @refer_code = session[:referral_code]
      if @referrer.save
        redirect_to refer_path, notice: "Referrer was successfully created."
      else
        render :new, status: :unprocessable_entity
    end
  end

  def update
      if @referrer.update(referrer_params)
       redirect_to referrer_url(@referrer), notice: "Referrer was successfully updated."
      else
     render :edit, status: :unprocessable_entity
      end
  end

  private
    def set_referrer
      @referrer = Referrer.find(params[:id])
    end

    def referrer_params
      params.require(:referrer).permit(:paytm_number,:upi_id,:app_offer_id,:aff_status,:ref_status)
    end
end
