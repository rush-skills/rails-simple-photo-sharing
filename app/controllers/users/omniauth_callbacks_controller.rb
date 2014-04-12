class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
      auth = (request.env["omniauth.auth"])
      @user.provider = auth.provider
      @user.uid = auth.uid
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
    auth = (request.env["omniauth.auth"])
    @user.provider = auth.provider
    @user.uid = auth.uid
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def openid
    # You need to implement the method below in your model
    @user = User.find_for_openid(env["omniauth.auth"], current_user)
    auth = (request.env["omniauth.auth"])
    @user.provider = auth.provider
    @user.uid = auth.uid
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.openid_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def passthru

  end
end