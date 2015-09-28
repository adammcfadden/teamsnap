class SessionsController < ApplicationController
  def new
    if user_logged_in?
      redirect_to users_path
    else
      redirect_to %Q(https://auth.teamsnap.com/oauth/authorize?client_id=#{ENV["CLIENT_ID"]}&redirect_uri=http://localhost:3000/login&response_type=code)
    end
  end

  def set_current_session
    session[:code] = params[:code]
    get_and_set_auth_token
    get_and_set_user
    get_and_set_team
    redirect_to users_path
  end

  def destroy_current_session
    reset_session
    redirect_to root_path
  end

  private
  def get_and_set_auth_token
    response = RestClient.post %Q(https://auth.teamsnap.com/oauth/token), {:client_id => ENV["CLIENT_ID"], :client_secret => ENV["CLIENT_SECRET"], :redirect_uri => "http://localhost:3000/login", :code => session[:code], :grant_type => "authorization_code"}
    token = JSON.parse(response)["access_token"]
    session[:auth_token] = token
  end

  def get_and_set_team
    raw_team_info = Team.get_team_info(current_user, auth_token)
    parsed_team_info = CollectionJSON.parse(raw_team_info)
    @team = Team.create_team_item(parsed_team_info)
    set_current_team(@team)
  end

  def get_and_set_user
    raw_user_info = User.get_current_user_info(auth_token)
    parsed_user_info = CollectionJSON.parse(raw_user_info)
    @user = User.create_user_item parsed_user_info
    set_current_user(@user)
  end
end
