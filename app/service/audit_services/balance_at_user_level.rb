class AuditServices::BalanceAtUserLevel < ApplicationService
  def initialize(user_id)
    @user_id = user_id
  end

  def call
    return Audit.where(user_id:@user_id).or(Audit.where(user_id2:@user_id))
  end
end
