class PickupsController < ApplicationController
  before_action :set_room
  before_action :authenticate_user!

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
    @pickup = Pickup.find(params[:id])
    @students = Student.where(room_id:@room.id).where(pickup_id: @pickup.id)
    @pickups = Pickup.where(room_id:@room.id)
    @teams = Team.where(room_id: @room.id)
  end
  
  

  private
  def set_room
    @room = Room.find(params[:room_id])
  end

  def params_pickup
    params.require(:pickup).permit(:name).merge(room_id: params[:room_id])
  end
end
