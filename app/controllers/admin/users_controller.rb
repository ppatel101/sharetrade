class Admin::UsersController < AdminController
  include UpdateHelper
  before_action :find_user, except: [:index, :new, :create]

  def index
    if current_admin.organization
      @users = current_admin.users
    else
      @users = []
    end
  end

  def new
    @user = User.new
  end

  def create
    if current_admin.organization
      @user = current_admin.organization.users.new(user_params)
    else
      @user = User.new(user_params)
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
      else
        format.html { render 'new'}
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    distinct_year_month(@user.id)
    daily_update_record(params['updates_select_by_month_year'], @user)
    @projects = @user.projects
    respond_to do |format|
      format.html { render 'show'}  
      format.js
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
      else
        format.html { render 'edit'}
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
    end
  end

  private
    def user_params
      params.require(:user).permit( :email, :password, :name, :joining_date, :birth_date, :gender, :qualification, :mobile_number,:address, :native_address, :parent_name, :parent_mobile_number, 
      :organization_id )
    end

    def find_user
      @user = User.find(params[:id])
    end
end
