class GroupsController < ApplicationController
  before_action :move_to_root, unless: :user_signed_in?
  def index
    @groups = Group.all
  end
  
  def new
    @groups = Group.all
    @group = Group.new
  end
  
  def create
    @group = Group.new(params_group)
    if @group.save
      GroupUser.create(group_id: @group.id, user_id: current_user.id)
      redirect_to groups_path
    else
      render 'new'
    end
  end
  
  
  private

  def move_to_root
    redirect_to root_path
  end

  def params_group
    params.require(:group).permit(:name)
  end

end
