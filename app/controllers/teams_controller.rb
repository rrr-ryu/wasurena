class TeamsController < ApplicationController
  before_action :set_room
  before_action :authenticate_user!

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
    @team = Team.find(params[:id])
    @students = Student.where(room_id: @room.id).where(team_id: @team.id)
    @pickups = Pickup.where(room_id: @room.id)
    @teams = Team.where(room_id: @room.id)
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def params_team
    params.require(:team).permit(:name).merge(room_id: params[:room_id])
  end
end
