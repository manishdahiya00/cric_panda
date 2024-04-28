class GameRewardsController < ApplicationController
  layout "admin"
  before_action :require_manager
  def index
    @game_rewards = GameReward.all.order("id DESC")
  end
end
