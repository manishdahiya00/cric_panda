class CampaignInfosController < ApplicationController
  before_action :set_campaign_info, only: %i[ show edit update destroy ]
  def index
    @campaign_infos = CampaignInfo.all
  end
  def show
  end
  def new
    @campaign_info = CampaignInfo.new
  end
  def edit
  end
  def create
    @campaign_info = CampaignInfo.new(campaign_info_params)
      if @campaign_info.save
   redirect_to campaign_info_url(@campaign_info), notice: "Campaign info was successfully created."
      else
   render :new, status: :unprocessable_entity
      end
    end
  def update
      if @campaign_info.update(campaign_info_params)
      redirect_to campaign_info_url(@campaign_info), notice: "Campaign info was successfully updated."
      else
render :edit, status: :unprocessable_entity
      end
    end
  def destroy
    @campaign_info.destroy!
      format.html { redirect_to campaign_infos_url, notice: "Campaign info was successfully destroyed." }
  end

  private
    def set_campaign_info
      @campaign_info = CampaignInfo.find(params[:id])
    end
    def campaign_info_params
      params.require(:campaign_info).permit(:redirect_url, :title, :amount, :offer_steps, :terms_n_condition, :status, :identifier, :source, :publisher)
    end
end
