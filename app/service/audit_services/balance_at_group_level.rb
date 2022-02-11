class AuditServices::BalanceAtGroupLevel < ApplicationService
  def initialize(group_id)
    @group_id = group_id
  end

  def call
    return Audit.where(group_id:@group_id)
  end
end


