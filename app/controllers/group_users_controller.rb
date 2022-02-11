class GroupUsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    GroupUserServices::CreateGroupUser.call(group_user_params)
  end

  private
  def group_user_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
end