module Admin
	class RefUserController < ApplicationController
	layout "admin"
	def show
		@ref_user = RefUser.find(params[:id])
	end
end
end