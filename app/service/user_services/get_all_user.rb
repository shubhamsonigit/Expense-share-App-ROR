class UserServices::GetAllUser < ApplicationService
  def call
    users = User.all
    return users
  end
end
