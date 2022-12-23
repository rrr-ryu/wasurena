class StudentsController < ApplicationController
  before_action :set_room
  before_action :authenticate_user!

  def index
    @students = Student.where(room_id:@room.id).where(team_id: nil)
    @pickups = Pickup.where(room_id:@room.id)
    @teams = Team.where(room_id:@room.id)
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
  
  

  private
  def set_room
    @room = Room.find(params[:room_id])
  end

  def params_student
    params.require(:student)
          .permit(:last_name, :first_name, :team_id, :pickup_id, :image)
          .merge(room_id: params[:room_id])
  end
  
end
