module ApplicationHelper
  def new_team_folder_with_parent_path
    new_team_folder_path(params[:team_path] || params[:path], parent: (params[:path] if params[:team_path]))
  end

  def edit_current_item_path
    if params[:team_path]
      edit_team_folder_path params[:team_path], params[:path]
    else
      edit_team_path params[:path]
    end
  end
end
