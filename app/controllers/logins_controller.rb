module Admin
  class LoginsController < ApplicationController
  def new
  end

  def google_login
    if user = authenticate_with_google
      cookies.signed[:user_id] = session[:user_id]
      redirect_to profile_path
    else
      puts user
      redirect_to root_path, alert: 'authentication_failed'
    end
  end

  private
    def authenticate_with_google
      if id_token = flash[:google_sign_in]["id_token"]
        user = RefUser.find_by social_token: GoogleSignIn::Identity.new(id_token).user_id
        if user.present?
          session[:user_id] = user.id
          return true
        else
          password = SecureRandom.hex(12)
          @user = RefUser.new(email:GoogleSignIn::Identity.new(id_token).email_address,password_digest:password,name:GoogleSignIn::Identity.new(id_token).name,social_token:GoogleSignIn::Identity.new(id_token).user_id,social_imgUrl:GoogleSignIn::Identity.new(id_token).avatar_url,oauth_response:GoogleSignIn::Identity.new(id_token).inspect,social_type:"Google",source_ip:request.ip)
          if @user.save
            session[:user_id] = @user.id
            return true
          else
            return false
          end
        end
      elsif error = flash[:google_sign_in][:error]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
end
end