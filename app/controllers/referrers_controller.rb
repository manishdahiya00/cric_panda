class ReferrersController < ApplicationController

  layout  "admin"
before_action :require_manager
  before_action :set_referrer, only: %i[ show edit update]

  def index
    if params[:paytm_number].present?
    @referrers = Referrer.where("paytm_number LIKE ?", "%#{params[:paytm_number]}%").order("id DESC").page(params[:page])
    @app_offers = AppOffer
    else
    @referrers = Referrer.all.order("created_at DESC").order("id DESC").page(params[:page])
    @app_offers = AppOffer
    end
  end

  def show
  end

  def new
    @referrer = Referrer.new
  end

  def edit
  end

  def create
    click_id = SecureRandom.hex(18)
    @app_offer_id = params["referrer"][:app_offer_id]
    app_offer = AppOffer.find_by(id: @app_offer_id)
    @referrer = Referrer.new(paytm_number:params["referrer"][:paytm_number],upi_id:params["referrer"][:upi_id],app_offer_id:params["referrer"][:app_offer_id],click_id:click_id,affiliate_id:params["referrer"][:affiliate_id])
    @refer_code = session[:referral_code]
      if @referrer.save
        puts params
          redirect_to "#{app_offer.action_url}?click_id=#{click_id}", allow_other_host: true
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
      params.require(:referrer).permit(:paytm_number,:upi_id,:app_offer_id,:aff_status,:ref_status,:affiliate_id)
    end
end
