class ApplicationController < ActionController::Base

  private
  def authenticate
    rodauth.require_account # redirect to login page if not authenticated
  end
end
