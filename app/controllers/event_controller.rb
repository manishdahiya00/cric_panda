class EventController < ApplicationController
  layout "admin"
  def index
    @events = Event.all.order("id DESC").page(params[:page])
  end
  def show
  end
  def new
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to app_offers_path
    end
  end
  def edit
  end
  def update
    @event = Event.find(params[:event_id])
    if @event.update(event_params)
      @app_offer = AppOffer.find(params[:app_offer_id])
      redirect_to app_offer_path(@app_offer)
    else
      render :edit
    end
  end
  def destroy
    @event = Event.find(params[:event_id])
    @event.destroy!
    @app_offer = AppOffer.find(params[:app_offer_id])
    redirect_to app_offer_path(@app_offer)
  end
  private

  def event_params
    params.permit(:event_title,:event_amount,:pay_type,:event_order,:app_offer_id)
  end
end