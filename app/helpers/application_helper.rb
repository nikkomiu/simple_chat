module ApplicationHelper
  def new_team_folder_with_parent_path
    new_team_folder_path(params[:team_path] || params[:path], parent: (params[:path] if params[:team_path]))
  end
end
