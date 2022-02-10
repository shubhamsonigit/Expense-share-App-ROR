class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    UserServices.create(user_params)
  end

  def get
    render json: UserServices.get(params[:id])
  end

  def all
    render json: UserServices.all
  end

  def update
    UserServices.update(params[:id],user_params)
  end

  def delete
    UserServices.delete(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
end