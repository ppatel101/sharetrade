class AdminsController < AdminController
  before_action :authenticate_admin!
  before_action :get_organization, only: [:new, :create, :edit, :update]
  before_action :find_admin, except: [:index, :new, :create]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Admin was successfully created.' }
      else
        format.html { render 'new'}
        format.json { render json: @admin.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_path, notice: 'Admin was successfully updated.' }
      else
        format.html { render 'edit'}
        format.json { render json: @admin.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Admin was successfully destroyed.' }
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :organization_id)
  end

  def find_admin
    @admin = Admin.find(params[:id])
  end

  def get_organization
    @organization_array = Organization.all.map {|c| [c.name, c.id]}
  end
end
