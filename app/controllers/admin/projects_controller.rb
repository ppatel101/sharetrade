class Admin::ProjectsController < AdminController
  before_action :find_project, except: [:index, :new, :create]
  before_action :get_users, only: [:new, :create, :edit, :update]

  def index
    if current_admin.organization
      @projects = current_admin.projects
    else
      @projects = []
    end
  end

  def new 
    @project = Project.new
  end

  def create
    if current_admin.organization
      @project = current_admin.projects.new(project_params)
    else
      @project = Project.new(project_params)
    end
    respond_to do |format|
      if @project.save
        @project.user_ids = current_admin.users.where(id: params['user_ids']).pluck(:id)
        format.html { redirect_to admin_projects_path, notice: 'Project was successfully created.' }
      else
        format.html { render 'new'}
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        @project.user_ids = current_admin.users.where(id: params['user_ids']).pluck(:id) 
        format.html { redirect_to admin_projects_path, notice: 'Project was successfully updated.' }
      else
        render :edit
      end
    end
  end
  
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to admin_projects_path, notice: 'Project was successfully destroyed.' }
    end
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end

  def find_project
    @project = Project.find(params[:id])
  end
  
  def get_users
    if current_admin.organization
      @users_array = current_admin.users.all.map {|c| [c.name, c.id]}
    else
      @users_array = []
    end
  end
end
