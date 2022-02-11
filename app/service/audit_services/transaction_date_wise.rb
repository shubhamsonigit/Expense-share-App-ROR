class AuditServices::TransactionDateWise < ApplicationService
  def initialize(group_id)
    @group_id = group_id
  end

  def call
    return Audit.where(group_id:@group_id).order(:created_at)
  end
end
