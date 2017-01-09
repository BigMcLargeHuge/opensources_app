class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, :alert => "Please sign in first." }
    end
  end

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, notice: "Please sign in before submitting content."
    end
  end
end
