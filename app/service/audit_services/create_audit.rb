class AuditServices::CreateAudit < ApplicationService
  def initialize(audit_params,distributed_amount)
    @audit_params = audit_params
    @distributed_amount = distributed_amount
  end

  def call
    GroupUser.where(group_id: @audit_params[:group_id]).each do |group_user|
      if group_user.user_id == @audit_params[:user_id]
        next
      end
      if Audit.exists?(user_id:@audit_params[:user_id],user_id2:group_user.user_id)
        audit = Audit.where(user_id:@audit_params[:user_id],user_id2:group_user.user_id).take
        audit.amount += @distributed_amount
      else
        audit = Audit.new(user_id:@audit_params[:user_id],user_id2:group_user.user_id,group_id:@audit_params[:group_id],amount:@distributed_amount)
      end
      audit.save!
    end
  end
end

