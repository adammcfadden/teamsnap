class Team < ActiveRecord::Base

  def self.get_team_info(current_user, auth_token)
    RestClient.get %Q(https://api.teamsnap.com/v3/teams/search?user_id=#{current_user.fetch("id")}), {:Authorization => "Bearer #{auth_token}"}
  end

  def self.create_team_item(parsed_team_info)
    team = {}
    parsed_team_info.items.first.data.each do |item|
      team[item.name] = item.value
    end
    team
  end

  def self.get_team_members(team_id, auth_token)
    RestClient.get %Q(https://api.teamsnap.com/v3/members/search?team_id=#{team_id}), {:Authorization => "Bearer #{auth_token}"}
  end

  def self.create_members_item(parsed_member_info)
    members = []
    parsed_member_info.items.each do |member_data|
      member = {}
      member_data.data.each do |item|
        member[item.name] = item.value
      end
      members << member
    end
    members
  end
end
