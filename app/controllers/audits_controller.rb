class AuditsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    count_of_user = GroupUserServices::CountOfUser.call(audit_params[:group_id])
    distributed_amount = audit_params[:amount]/count_of_user
    AuditServices::CreateAudit.call(audit_params,distributed_amount)
  end

  def get_balance_at_user_level
    render json: AuditServices::BalanceAtUserLevel.call(params[:id])
  end

  def get_balance_at_group_level
    render json: AuditServices::BalanceAtGroupLevel.call(params[:id])
  end

  def get_transaction_date_wise
    render json: AuditServices::TransactionDateWise.call(params[:id])
  end

  private
  def audit_params
    params.require(:audit).permit(:user_id,:group_id,:amount)
  end
end