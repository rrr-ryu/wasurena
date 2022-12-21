class RoomsController < ApplicationController
  before_action :move_to_root, unless: :user_signed_in?
  def index
    @rooms = Room.all
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
    @room = Room.find(params[:id])
  end
  


  private

  def move_to_root
    redirect_to root_path
  end

  def params_room
    params.require(:room).permit(:name)
  end

end
