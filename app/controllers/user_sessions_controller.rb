class UserSessionsController < ApplicationController
  include AuthenticationEngine::Authentication::UserSession

  # GET /login
  def new
    @user_session = UserSession.new
  end

  # POST /user_session
  def create
    @user_session = UserSession.new(params[:user_session])

    @user_session.save do |result|
      if result
        flash[:success] = t('user_sessions.flashs.success.create')
        session[:language] = nil
        session[:return_to] = nil if session[:return_to] == "/logout"
        redirect_back_or_default root_url
      else
        render :action => :new
      end
    end
  end

  # DELETE /logout
  def destroy
    current_user_session.destroy
    flash[:success] = t('user_sessions.flashs.success.destroy')
    session[:language] = nil
    session[:return_to] = nil
    redirect_back_or_default login_url
  end
end