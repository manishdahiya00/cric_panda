class GameawardController < ApplicationController
	def index
		@gameAward = GameAward.find_by(award_id:params[:award_id]).page(params[:page])
	end
	def new
		@gameReward = GameReward.new
	end
	def create
		@gameReward = GameReward.new(gameReward_params.merge(source_ip:request.remote_ip))
		if @gameReward.save
			redirect_to root_path
		else
		end
	end
	private
	def gameReward_params
		params.permit(:player_id,:game_award_id)
	end
end