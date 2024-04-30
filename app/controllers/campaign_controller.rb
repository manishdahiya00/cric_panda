class CampaignController < ApplicationController
before_action :require_manager
  before_action :set_campaign, only: %i[ show edit update destroy ]
  def index
    @campaigns = Campaign.all.order("id DESC").page(params[:page])
  end
  def show
  end
  def new
    @campaign = Campaign.new
  end
  def edit
  end
  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign_info.save
      render plain: "created", notice: "Campaign info was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def update
    if @campaign.update(campaign_params)
      render plain: "updated", notice: "Campaign info was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @campaign.destroy!
    render plain: "deleted", notice: "Campaign was successfully destroyed."
  end
  private
  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
  def campaign_params
    params.require(:campaign).permit(:click_id, :source_ip, :phone, :version_code, :version_name, :status, :source, :mobile, :amount,:status)
  end
end
