class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
  def all
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = AdminUser.from_omniauth(request.env['omniauth.auth'])
    if !@user.nil?
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    else
      redirect_to root_path, notice: "登入失敗"
    end
  end

  alias_method :google_oauth2, :all 
end
