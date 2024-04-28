class RefUserController < ApplicationController
	layout "admin"
	before_action :require_manager
	def show
		@ref_user = RefUser.find(params[:id])
	end
end