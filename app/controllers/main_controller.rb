class MainController < ApplicationController
  def index
    @app_offers = AppOffer.all.where(status: true)
    session[:referral_code] ||= SecureRandom.hex(4)
  end
  def offer
    @app_offer = AppOffer.find(params[:app_offer_id])
    @referral_code = session[:referral_code]
  end
  def refer
    @referral_code = session[:referral_code]
    @app_offer = AppOffer.find(params[:app_offer_id])
    @offer_name = @app_offer.offer_name
  end
end