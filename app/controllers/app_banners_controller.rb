class AppBannersController < ApplicationController
  layout  "admin"

  before_action :set_app_banner, only: %i[ show edit update destroy ]
  def index
    @app_banners = AppBanner.all
  end
  def show
  end
  def new
    @app_banner = AppBanner.new
  end
  def edit
  end
  def create
    @app_banner = AppBanner.new(app_banner_params)

      if @app_banner.save
         redirect_to app_banner_url(@app_banner), notice: "App banner was successfully created."
      else
         render :new, status: :unprocessable_entity
    end
  end
  def update
      if @app_banner.update(app_banner_params)
        redirect_to app_banner_url(@app_banner), notice: "App banner was successfully updated."
      else
       render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @app_banner.destroy!

    redirect_to app_banners_url, notice: "App banner was successfully destroyed."
  end

  private
    def set_app_banner
      @app_banner = AppBanner.find(params[:id])
    end
    def app_banner_params
      params.require(:app_banner).permit(:image_url, :redirect_url, :status)
    end
end
