module Admin
	class SessionsController < ApplicationController
	 def current_manager
   	 @current_manager ||= Manager.find_by(id: session[:manager_id])
  	end

 	def require_manager
   	 redirect_to admin_path unless current_manager
 	end
end
end