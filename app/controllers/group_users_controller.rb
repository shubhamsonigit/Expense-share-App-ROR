class GroupUsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    GroupUserServices.create(group_user_params)
  end

  def get
    render json: GroupUserServices.get(params[:id])
  end

  def all
    render json: GroupUserServices.all
  end

  def update
    GroupUserServices.update(params[:id],group_user_params)
  end

  def delete
    GroupUserServices.delete(params[:id])
  end

  private
  def group_user_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
end