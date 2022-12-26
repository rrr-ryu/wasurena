class RoomsController < ApplicationController
  before_action :authenticate_user!
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
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
      if @room.update_attributes(params_room)
        redirect_to room_path
      else
        render 'edit'
      end
  end
  

  private

  def move_to_root
    redirect_to root_path
  end

  def params_room
    params.require(:room).permit(:name)
  end
end
