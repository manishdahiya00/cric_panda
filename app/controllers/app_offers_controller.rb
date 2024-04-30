class AppOffersController < ApplicationController
  layout  "admin"
  before_action :require_manager
  before_action :set_app_offer, only: %i[show edit update]
  def index
    if params[:offer_name].present?
      @app_offers = AppOffer.where("offer_name LIKE ?", "%#{params[:offer_name]}%").order("id DESC").page(params[:page])
    else
      @app_offers = AppOffer.all.order("id DESC").page(params[:page])
    end
  end
  def new
    @app_offer = AppOffer.new
  end
  def show
    @events = Event.where(app_offer_id:params[:id])
  end
  def edit
    @events = @app_offer.events.all
  end
  def create
    @app_offer = AppOffer.new(app_offer_params)
      if @app_offer.save
    redirect_to app_offers_path, notice: "App offer was successfully created."
      else
     render :new, status: :unprocessable_entity
    end
  end
  def update
      if @app_offer.update(app_offer_params)
        redirect_to app_offers_path , notice: "App offer updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

  private
    def set_app_offer
      @app_offer = AppOffer.find(params[:id])
    end
    def app_offer_params
      params.require(:app_offer).permit(:offer_name, :identifier, :description, :instructions, :payout_amount, :retention_offer, :retention_amount, :retention_day, :action_url, :refer_amount, :image_url, :daily_cap, :status, :whatsapp_link, :event_offer, :priority, :insta_offer)
    end
end
