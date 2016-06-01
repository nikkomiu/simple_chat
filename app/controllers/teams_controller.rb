class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  def index
    @teams = Team.all
  end

  def show
    @folders = @team.folders.where(parent: nil)
    @rooms = @team.rooms.where(folder_id: nil)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:team).permit(:name, :description)
  end
end
