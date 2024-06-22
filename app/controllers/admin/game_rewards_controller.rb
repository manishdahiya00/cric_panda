module Admin
  class GameRewardsController < ApplicationController
  layout "admin"
  def index
    @game_rewards = GameReward.all.order("id DESC").page(params[:page])
  end
end

end