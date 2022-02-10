class AuditsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    group_id = audit_params[:group_id]
    count = GroupUser.where(group_id: group_id).count
    equalAmount = audit_params[:amount]/count
    GroupUser.where(group_id: group_id).each do |groupUser|
      print(groupUser.user_id)
      if groupUser.user_id == audit_params[:user_id]
        next
      end

      if Audit.exists?(user_id:audit_params[:user_id],user_id2:groupUser.user_id)
        @audit = Audit.where(user_id:audit_params[:user_id],user_id2:groupUser.user_id).take
        @audit.amount += equalAmount
      else
        @audit = Audit.new(user_id:audit_params[:user_id],user_id2:groupUser.user_id,group_id:group_id,amount:equalAmount)
      end

      @audit.save
    end
  end

  def get
    @audit = Audit.find(params[:id])
    render json: @audit
  end

  def all
    @audits = Audit.all
    render json: @audits
  end

  def update
    @audit = Audit.find(params[:id])
    if @audit.update(audit_params)
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.json { head :Failed}
      end
    end
  end

  def delete
    Audit.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def getBalanceAtUserLevel
    user_id = params[:id]
    render json: Audit.where(user_id:user_id).or(Audit.where(user_id2:user_id))
  end

  def getBalanceAtGroupLevel
    group_id = params[:id]
    render json: Audit.where(group_id:group_id)
  end

  private
  def audit_params
    params.require(:audit).permit(:user_id,:group_id,:amount)
  end
end