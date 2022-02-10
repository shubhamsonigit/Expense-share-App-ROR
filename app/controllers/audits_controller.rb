class AuditsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    countOfUser = AuditServices.get_count_of_user(audit_params[:group_id])
    distributedAmount = AuditServices.get_distributed_amount(audit_params[:amount],countOfUser)
    AuditServices.create(audit_params,distributedAmount)
  end

  def get
    render json: AuditServices.get(params[:id])
  end

  def all
    render json: AuditServices.all
  end

  def update
    AuditServices.update(params[:id],audit_params)
  end

  def delete
    AuditServices.delete(params[:id])
  end

  def getBalanceAtUserLevel
    render json: AuditServices.get_balance_user_level(params[:id])
  end

  def getBalanceAtGroupLevel
    render json: AuditServices.get_balance_group_level(params[:id])
  end

  def getTransactionDateWise
    render json: AuditServices.get_transaction_date_wise(params[:id])
  end

  private
  def audit_params
    params.require(:audit).permit(:user_id,:group_id,:amount)
  end
end