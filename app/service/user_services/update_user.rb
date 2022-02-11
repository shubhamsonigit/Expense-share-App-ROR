class UserServices::UpdateUser < ApplicationService
  def initialize(id,user_params)
    @id = id
    @user_params = user_params
  end

  def call
    user = User.find(@id)
    user.update(@user_params)
  end
end
