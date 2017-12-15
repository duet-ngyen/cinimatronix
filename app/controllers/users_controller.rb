class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def index
    @users = if params[:search_value].present?
      User.where("name like ?", "%#{params[:search_value]}%")
    else
      User.all
    end

    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def update

    update_user = false

    if @user.update(user_params)
      update_user = true
    end

    respond_to do |format|
      format.json {
        render json: {
          updated_user: update_user
        }
      }
    end
  end

  def destroy
    destroyed = @user.destroy ? true : false

    respond_to do |format|
      format.json {
        render json: {
          destroyed_user: destroyed
        }
      }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
