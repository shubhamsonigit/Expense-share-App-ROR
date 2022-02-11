class GroupUserServices::CreateGroupUser < ApplicationService
  def initialize(group_user_params)
    @group_user_params = group_user_params
  end

  def call
    group_user = GroupUser.new(@group_user_params)
    group_user.save!
  end
end
