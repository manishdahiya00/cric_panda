module Admin
	class AdminController < ActionController::Base
	# before_action :authenticate_admin!

    # def authenticate_admin!
    #   redirect_to admin_path unless session[:admin_id].present?
    # end
  end
end