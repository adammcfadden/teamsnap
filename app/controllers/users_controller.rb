class UsersController < ApplicationController
  def index
    raw_user_info = User.get_current_user_info(session["auth_token"])
    parsed_user_info = CollectionJSON.parse(raw_user_info)
    @user = User.create_user_item parsed_user_info
    set_current_user(@user)
  end
end
