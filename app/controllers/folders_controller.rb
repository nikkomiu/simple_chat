class FoldersController < ApplicationController
  before_action :set_folder, only: [:edit, :update, :destroy]

  def index
    redirect_to team_path params[:team_path]
  end

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

  def new
    @folder = Folder.new
    @team = Team.find_by(path: params[:team_path])
  end

  def create
    @parent = Folder.where(path: folder_params['parent_name']).select(:id).first
    @team = Team.where(path: params[:team_path]).first
    @folder = Folder.create(name: folder_params['name'], parent: @parent, team: @team)

    respond_to do |format|
      if @folder.save
        format.html { redirect_to team_folder_path(@team.path, @folder.path), notice: 'Folder was successfully created.' }
        format.json { render :show, status: :created, location: team_folder_path(@team, @folder.path) }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @folder.update(name: folder_params['name'])
        format.html { redirect_to team_folder_path(@team.path, @folder.path), notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: team_folder_path(@team.path, @folder.path) }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    f = @folder.destroy

    if f.parent_id
      redirect_to team_folder_path(@team.path, f.parent.path)
    else
      redirect_to team_path(@team.path)
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def folder_params
    params.require(:folder).permit(:name, :parent_name)
  end

  def set_folder
    @team = Team.find_by(path: params[:team_path])
    @folder = Folder.find_by(path: params[:path])
  end
end
