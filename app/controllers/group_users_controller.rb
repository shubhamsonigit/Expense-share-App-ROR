class GroupUsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @groupUser = GroupUser.new(groupUser_params)
    if @groupUser.save
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.json { head :Failed}
      end
    end
  end

  def get
    @groupUser = GroupUser.find(params[:id])
    render json: @groupUser
  end

  def all
    @groupUsers = GroupUser.all
    render json: @groupUsers
  end

  def update
    @groupUser = GroupUser.find(params[:id])
    if @groupUser.update(groupUser_params)
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
    GroupUser.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  private
  def groupUser_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
end