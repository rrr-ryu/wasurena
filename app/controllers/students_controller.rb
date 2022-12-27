class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  before_action :set_room

  def index
    @students = Student.where(room_id: @room.id).where(team_id: nil)
    @pickups = Pickup.where(room_id: @room.id)
    @teams = Team.where(room_id: @room.id)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params_student)
    if @student.save
      redirect_to room_students_path
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end
  

  def update
    @student = Student.find(params[:id])
    @student.update_attributes(params_ride_attend)
  end

  private
  def move_to_root
    @user_rooms = UserRoom.where(room_id: params[:room_id])
    unless @user_rooms.exists?(user_id: current_user.id)
      redirect_to root_path
    end
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def params_student
    params.require(:student)
          .permit(:last_name, :first_name, :team_id, :pickup_id, :image)
          .merge(room_id: params[:room_id])
  end

  def params_ride_attend
    params.require(:student)
          .permit(:ride_id, :attend_id)
  end
end
