class SessionsController < ApplicationController
  def new
    if session[:auth_token].nil?
      redirect_to %Q(https://auth.teamsnap.com/oauth/authorize?client_id=#{ENV["CLIENT_ID"]}&redirect_uri=#{ENV["REDIRECT_URI"]}&response_type=#{ENV["RESPONSE_TYPE"]})
    else
      redirect_to users_path
    end
  end
end
