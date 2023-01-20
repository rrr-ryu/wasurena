class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  before_action :set_room
  before_action :set_student, only: [:edit, :update, :show, :destroy, :update_edit]

  def index
    @students = Student.where(room_id: @room.id).where(team_id: nil).order(last_name: :asc).order(first_name: :asc)
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
    @comment = Comment.new
    @comments = @student.comments.includes(:student)
  end

  def edit
  end

  def update
    @student.update_attributes(params_ride_attend)
  end

  def update_edit
    if @student.update_attributes(params_student)
      redirect_to room_student_path
    else
      render 'edit'
    end
  end

  def destroy
    if @student.destroy
      redirect_to room_students_path
    else
      render 'edit'
    end
  end

  def reset_attend
    @students = Student.all
    @students.each do |s|
      s.attend_id = nil
      s.save
    end
    redirect_to room_students_path(id: params[:room_id])
  end

  def reset_ride
    @students = Student.all
    @students.each do |s|
      s.ride_id = nil
      s.save
    end
    redirect_to room_students_path(id: params[:room_id])
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

  def set_student
    @student = Student.find(params[:id])
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
