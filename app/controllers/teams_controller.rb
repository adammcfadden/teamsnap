class TeamsController < ApplicationController
  def index
    @team = current_team
  end
end
