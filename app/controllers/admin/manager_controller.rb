module Admin
  class ManagerController < AdminController
  def new
    # if session[:admin_id].present?
    #   redirect_to admin_root_path
    # else
    #   render :new
    # end
  end


  def create
    puts params
    admin = Manager.find_by(username: params[:manager][:username])
    puts admin
    if admin && admin.authenticate(params[:manager][:password_digest])
      session[:admin_id] = admin.id
      redirect_to admin_app_redeems_path
    else
      flash[:alert] = 'Invalid username or password'
      redirect_to admin_path
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_path
  end
end
end