class ApplicationController < ActionController::Base
  include AuthenticationEngine::Authentication::Base
  include AuthenticationEngine::Authorization::Base
  include AuthenticationEngine::Localization

  helper :all
  helper_method :logged_in?
  filter_parameter_logging :password, :password_confirmation

  before_filter :set_current_tab

  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # GET /
  def index
  end

  private

  def set_current_tab
    @current_tab ||= controller_name.to_sym
  end

  def logged_in?
    !!current_user_session
  end
end