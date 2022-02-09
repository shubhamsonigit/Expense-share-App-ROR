

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.json { head :Failed}
      end
    end
  end

  def get
    @user = User.find(params[:id])
    render json: @user
  end

  def all
    @users = User.all
    render json: @users
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.json { head :Failed}
      end
    end
  end

  def delete
    User.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
end


