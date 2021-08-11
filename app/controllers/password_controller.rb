class PasswordController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update]

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'password was successfully updated.' }
      else
        format.html { render 'edit'}
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:password,:password_confirmation)
    end

    def find_user
      @user = current_user
    end
end
