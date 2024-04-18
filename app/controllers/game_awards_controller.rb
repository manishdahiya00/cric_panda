class GameAwardsController < ApplicationController

  layout  "admin"

  before_action :set_game_award, only: %i[ show edit update destroy ]
  def index
    @game_awards = GameAward.all
  end
  def show
  end
  def new
    @game_award = GameAward.new
  end
  def edit
  end
  def create
    @game_award = GameAward.new(game_award_params)
      if @game_award.save
        redirect_to game_award_path(@game_award), notice: "Game award was successfully created."
      else
       render :new, status: :unprocessable_entity
      end
  end
  def update
      if @game_award.update(game_award_params)
 redirect_to game_award_url(@game_award), notice: "Game award was successfully updated."
      else
         render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @game_award.destroy!
    redirect_to game_awards_url, notice: "Game award was successfully destroyed."
    end

  private
    def set_game_award
      @game_award = GameAward.find(params[:id])
    end
    def game_award_params
      params.require(:game_award).permit(:title, :image_url, :rules, :status, :identifier, :redirect_url, :input_name, :publisher)
    end
end
