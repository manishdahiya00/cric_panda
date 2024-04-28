class ManagerController < ApplicationController
  def new
    if session[:manager_id].present?
      redirect_to app_offers_path
    else
      render :new
    end
  end
  def create
    puts params
    manager = Manager.find_by(username: params[:manager][:username])
    if manager && manager.authenticate(params[:manager][:password_digest])
      session[:manager_id] = manager.id
      redirect_to app_offers_path
    else
      flash[:alert] = 'Invalid username or password'
      redirect_to admin_path
    end
  end
  def destroy
    session[:manager_id] = nil
    redirect_to admin_path
  end
end
