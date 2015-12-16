class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :do_login, :assign_global_alert

  private

  def assign_global_alert
    @global_alert = ENV['GLOBAL_ALERT'].to_s
  end

  def do_login
    if session['user_id']
      @current_user = User.where(uid: session['user_id']).first
      session['user_id'] = nil unless @current_user
    end
  end

  def do_check_login
    raise unless @current_user
  end
end
