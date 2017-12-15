class UsersController < ApplicationController
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
end
