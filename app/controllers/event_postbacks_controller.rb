class EventPostbacksController < ApplicationController
	layout "admin"
	before_action :require_manager
	def index
		if params[:event_name].present?
      		@postbacks = EventPostback.where("event_title LIKE ?", "%#{params[:event_name]}%").order("id DESC").page(params[:page])
    	else
     		@postbacks = EventPostback.all.where(duplicate:false).order("id DESC").page(params[:page])
     	end
    end
end
