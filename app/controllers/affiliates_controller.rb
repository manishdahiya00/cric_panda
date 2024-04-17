class AffiliatesController < ApplicationController
  before_action :set_affiliate, only: %i[ show edit update destroy ]

  def index
    @affiliates = Affiliate.all
  end
  def show
  end
  def new
    @affiliate = Affiliate.new
  end
  def edit
  end
  def create
    @affiliate = Affiliate.new(affiliate_params)

      if @affiliate.save
 redirect_to affiliate_url(@affiliate), notice: "Affiliate was successfully created."
      else
    render :new, status: :unprocessable_entity
      end
  end
  def update
      if @affiliate.update(affiliate_params)
       redirect_to affiliate_url(@affiliate), notice: "Affiliate was successfully updated."
      else
         render :edit, status: :unprocessable_entity
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
