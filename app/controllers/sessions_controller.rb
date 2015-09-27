class SessionsController < ApplicationController
  def new
    if session[:auth_token].nil?
      redirect_to %Q(https://auth.teamsnap.com/oauth/authorize?client_id=#{ENV["CLIENT_ID"]}&redirect_uri=#{ENV["REDIRECT_URI"]}&response_type=#{ENV["RESPONSE_TYPE"]})
    else
      redirect_to users_path
    end
  end

  def get_code
    session[:code] = params[:code]
    response = RestClient.post %Q(https://auth.teamsnap.com/oauth/token), {:client_id => ENV["CLIENT_ID"], :client_secret => ENV["CLIENT_SECRET"], :redirect_uri => ENV["REDIRECT_URI"], :code => session[:code], :grant_type => "authorization_code"}
    token = JSON.parse(response)["access_token"]
    session[:auth_token] = token
    redirect_to users_path
  end
end
