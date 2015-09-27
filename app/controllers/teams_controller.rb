class TeamsController < ApplicationController
  def index
    raw_team_info = Team.get_team_info(current_user, auth_token)
    parsed_team_info = CollectionJSON.parse(raw_team_info)
    @team = Team.create_team_item(parsed_team_info)
    raw_member_info = Team.get_team_members(@team.fetch("id"), auth_token)
    parsed_member_info = CollectionJSON.parse(raw_member_info)
    @members = Team.create_members_item(parsed_member_info)
  end
end
