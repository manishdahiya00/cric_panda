module Admin
	class AppRedeemsController < ApplicationController
	require "json"
	def new
		@app_redeem = AppRedeem.new
	end
	def create
		@app_redeem = AppRedeem.new(app_redeem_params)
		if @app_redeem.save
			redirect_to profile_path,notice:"Request Submitted Successfully !!!!"
		else
			redirect_to profile_path,notice:"Something Went Wrong!!"
	end
end
	private

	def app_redeem_params
		params.require(:app_redeem).permit(:ref_user_id,:pay_phone,:pay_email,:pay_type,:pay_vendor,:upi_id,:pay_coin,:pay_amount,:status)
	end
end
end