class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    response = request.env["omniauth.auth"]
    session[:response] = response
    @user = User.from_omniauth(response)
    @user.skip_confirmation!

    if @user.persisted?
      session[:user_avatar] = response.except(:extra).info.image
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = response.except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end