class TeamFoldersController < ApplicationController
  def show
    # Get the rooms along with the folder (the will be needed)
    @team_folder = TeamFolder.includes(:rooms).find(params[:id])
    @rooms = @team_folder.rooms
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:team).permit(:name, :description)
  end
end
