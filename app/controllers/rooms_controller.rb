class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, except:[:index]
  before_action :set_room, only: [:edit, :update, :show, :destory]
  def index
    @user_rooms = UserRoom.where(user_id: current_user.id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params_room)
    if @room.save
      UserRoom.create(room_id: @room.id, user_id: current_user.id)
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def show
    @user_rooms = UserRoom.where(user_id: current_user.id)
  end

  def edit
  end
  
  def update
      if @room.update_attributes(params_room)
        redirect_to room_path
      else
        render 'edit'
      end
  end
  

  private

  def move_to_root
    @user_rooms = UserRoom.where(room_id: params[:id])
    unless @user_rooms.exists?(user_id: current_user.id)
      redirect_to root_path
    end
  end

  def params_room
    params.require(:room).permit(:name)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
