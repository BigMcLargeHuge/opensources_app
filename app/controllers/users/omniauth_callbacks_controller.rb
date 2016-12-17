class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end

  [:twitter, :github].each do |provider|
    provides_callback_for provider
  end

  def render_invalid
    redirect_to root_path, alert: "There was a problem logging you in using that provider (Twitter/Github).  Perhaps you've previously logged in using another provider?  If so, try that one."
  end

  # def after_sign_in_path_for(resource)
  #   if resource.email_verified?
  #     super resource
  #   else
  #     finish_signup_path(resource)
  #   end
  # end
end
