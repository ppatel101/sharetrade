class Admin::SystemsController < AdminController
  before_action :find_system, except: [:index, :new, :create]
  before_action :get_users, only: [:new, :create, :edit, :update]

  def index
    if current_admin.organization
      @systems = current_admin.systems
    else
      @systems = []
    end
  end

  def new
    @system = System.new
  end

  def create
    if current_admin.organization
      @system = current_admin.organization.systems.new(system_params)
    else
      @system = System.new(system_params)
    end
    respond_to do |format|
      if @system.save
        format.html { redirect_to admin_systems_path, notice: 'System was successfully created.' }
      else
        format.html { render 'new'}
        format.json { render json: @system.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @system.update(system_params)
        format.html { redirect_to admin_systems_path, notice: 'System was successfully updated.' }
      else
        format.html { render 'edit'}
      end
    end
  end

  def destroy
    @system.destroy
    respond_to do |format|
      format.html { redirect_to admin_systems_path, notice: 'System was successfully destroyed.' }
    end
  end

  private
    def system_params
      params.require(:system).permit(:name, :description, :purchase_date, :warranty_month, :user_id, :organization_id)
    end

    def find_system
      @system = System.find(params[:id])
    end

    def get_users
      if current_admin.organization
        @users_array = current_admin.users.all.map {|c| [c.name, c.id]}
      else
        @users_array = []
      end
    end
end
