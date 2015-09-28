class MembersController < ApplicationController
  def index
    team_id = current_team.fetch("id")
    raw_member_info = Member.get_team_members(team_id, auth_token)
    parsed_member_info = CollectionJSON.parse(raw_member_info)
    @members = Member.create_members_object(parsed_member_info)
  end

  def show
    @member = params[:member]
  end
end
