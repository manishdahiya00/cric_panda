class GameRewardsController < ApplicationController
  layout "admin"
  def index
    @game_rewards = GameReward.all
  end
end
