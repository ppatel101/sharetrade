class Admin::PasswordController < AdminController
  before_action :find_admin, only: [:edit, :update]

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admin_root_path, notice: 'password was successfully updated.' }
      else
        format.html { render 'edit'}
        format.json { render json: @admin.errors, status: :unprocessable_entity}
      end
    end
  end

private
  def admin_params
    params.require(:admin).permit(:password)
  end

  def find_admin
    @admin = current_admin
  end
end
