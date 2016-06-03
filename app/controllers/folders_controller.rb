class FoldersController < ApplicationController
  def show
    # Get the rooms along with the folder (the will be needed)
    @folder_list = []

    @folder_list.push(Folder.includes(:rooms, :children).find_by(path: params[:path]))

    while @folder_list.last.parent_id != nil
      @folder_list.push(@folder_list.last.parent)
    end

    @current_folder = @folder_list.shift

    @folders = @current_folder.children
    @rooms = @current_folder.rooms
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:team).permit(:name, :parent_id)
  end
end
