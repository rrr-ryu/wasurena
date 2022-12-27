class PickupsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  before_action :set_room
  before_action :set_pickup, only: [:edit, :update, :show, :destroy]

  def new
    @pickup = Pickup.new
  end

  def create
    @pickup = Pickup.new(params_pickup)
    if @pickup.save
      redirect_to room_students_path
    else
      render 'new'
    end
  end

  def show
    @students = Student.where(room_id: @room.id).where(pickup_id: @pickup.id)
    @pickups = Pickup.where(room_id: @room.id)
    @teams = Team.where(room_id: @room.id)
  end

  def edit
  end

  def update
    if @pickup.update_attributes(params_pickup)
      redirect_to room_pickup_path
    else
      render 'edit'
    end
  end

  def destroy
    if @pickup.destroy
      redirect_to room_students_path(id: params[:room_id])
    else
      redirect_to 'edit'
    end
  end

  private

  def move_to_root
    @user_rooms = UserRoom.where(room_id: params[:room_id])
    return if @user_rooms.exists?(user_id: current_user.id)

    redirect_to root_path
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def params_pickup
    params.require(:pickup).permit(:name).merge(room_id: params[:room_id])
  end

  def set_pickup
    @pickup = Pickup.find(params[:id])
  end
end
