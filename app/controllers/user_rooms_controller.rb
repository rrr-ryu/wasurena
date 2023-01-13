class UserRoomsController < ApplicationController
  before_action :move_to_root
  before_action :set_user_rooms
  def show
    @user = nil
  end

  def create
    @user_room = UserRoom.new(user_id: params[:add_user_id],room_id: params[:id])
    if  @user_room.save
      redirect_to user_room_path
    else
      render 'show'
    end
  end

  def update
    @user = User.find_by(uid: params[:keyword])
    if @user == nil
      @user = "error"
    elsif @user_rooms.exists?(user_id: @user.id)
      @user = "registered"
    end
    render 'show'
  end

  def destroy
    @user_room = UserRoom.find_by(room_id: params[:id],user_id: params[:delete_user_id])
    if @user_room.destroy
      redirect_to user_room_path
    end
  end
  
  

  private
  def set_user_rooms
    @user_rooms = UserRoom.where(room_id: params[:id])
  end

  def move_to_root
    access_user = UserRoom.find_by(room_id: params[:id], user_id: current_user.id)
    if access_user.nil?
      redirect_to root_path
    end
  end
  
end
