class FoldersController < ApplicationController
  def show
    # Get the rooms along with the folder (the will be needed)
    @folder = Folder.includes(:rooms, :children).find(params[:id])
    @folders = @folder.children
    @rooms = @folder.rooms
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:team).permit(:name, :description)
  end
end
