require 'json'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= session[:current_user]
  end

  def current_team
    @current_team ||= session[:current_team]
  end

  def auth_token
    @auth_token ||= session[:auth_token]
  end

  def set_current_user(user)
    session[:current_user] = user
  end

  def set_current_team(team)
    session[:current_team] = team
  end
end
