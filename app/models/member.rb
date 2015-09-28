class Member < ActiveRecord::Base

  def self.get_team_members(team_id, auth_token)
    RestClient.get %Q(https://api.teamsnap.com/v3/members/search?team_id=#{team_id}), {:Authorization => "Bearer #{auth_token}"}
  end

  def self.create_members_object(parsed_member_info)
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
