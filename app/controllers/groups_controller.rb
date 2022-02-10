class GroupsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    GroupServices.create(group_params)
  end

  def get
    render json: GroupServices.get(params[:id])
  end

  def all
    render json: GroupServices.all
  end

  def update
    GroupServices.update(params[:id],group_params)
  end

  def delete
    GroupServices.delete(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end