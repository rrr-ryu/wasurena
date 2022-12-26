class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  before_action :set_room
  before_action :set_team, only: [:edit, :update, :show, :destroy]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params_team)
    if @team.save
      redirect_to room_students_path
    else
      render 'new'
    end
  end

  def show
    @students = Student.where(room_id: @room.id).where(team_id: @team.id)
    @pickups = Pickup.where(room_id: @room.id)
    @teams = Team.where(room_id: @room.id)
  end

  def edit
  end

  def update
      if @team.update_attributes(params_team)
        redirect_to room_students_path
      else
        render 'edit'
      end
  end
  
  def destroy
    if @team.destroy
      redirect_to room_students_path(room_id: params[:room_id])
    else
      redirect_to 'edit'
    end
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

  def params_team
    params.require(:team).permit(:name).merge(room_id: params[:room_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end

end
