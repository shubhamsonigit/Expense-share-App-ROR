class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    UserServices::CreateUser.call(user_params)
  end

  def all
    render json: UserServices::GetAllUser.call
  end

  def update
    UserServices::UpdateUser.call(params[:id],user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
end