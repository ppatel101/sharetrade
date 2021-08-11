class Admin::PasswordsController < AdminController
  before_action :find_user, only: [:edit, :update]

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'password was successfully updated.' }
      else
        format.html { render 'edit'}
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:password)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
