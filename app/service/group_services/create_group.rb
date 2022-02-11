class GroupServices::CreateGroup < ApplicationService
  def initialize(group_params)
    @group_params = group_params
  end

  def call
    group = Group.new(@group_params)
    group.save
  end
end