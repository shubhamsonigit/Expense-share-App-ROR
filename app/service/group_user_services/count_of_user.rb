class GroupUserServices::CountOfUser < ApplicationService
  def initialize(group_id)
    @group_id = group_id
  end

  def call
    return GroupUser.where(group_id: @group_id).count
  end
end
