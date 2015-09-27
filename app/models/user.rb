class User < ActiveRecord::Base

  def self.get_current_user_info(auth_token)
    RestClient.get "https://api.teamsnap.com/v3/me", {:Authorization => "Bearer #{auth_token}"}
  end

  def self.create_user_item(parsed_user_info)
    user = {}
    parsed_user_info.items.first.data.each do |item|
      user[item.name] = item.value
    end
    user
  end

end
