class GroupsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    GroupServices::CreateGroup.call(group_params)
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end