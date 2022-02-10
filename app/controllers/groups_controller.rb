class GroupsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @group = Group.new(group_params)
    if @group.save
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
    @group = Group.find(params[:id])
    render json: @group
  end

  def all
    @groups = Group.all
    render json: @groups
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
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
    Group.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end