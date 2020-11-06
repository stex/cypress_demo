class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  protected

  def current_user
    @current_user ||= session[:user_id].presence && User.find(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def page
    [params[:page].to_i, 1].max
  end

  def per_page
    params[:per_page].to_i.then { |pp| pp.zero? ? 10 : pp }
  end
end
