class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room
  before_action :set_team, only: [:edit, :update, :show, :destory]

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
  

  private

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
