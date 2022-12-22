class TeamsController < ApplicationController
before_action :set_room
before_action :authenticate_user!

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params_team)
    if @team.save
      redirect_to room_team_path(id: @team.id)
    else
      render 'new'
    end
  end
  
  

  def show
    @teams = Team.where(room_id: @room.id)
    @team = Team.find(params[:id])
  end
  
  private
def set_room
  @room = Room.find(params[:room_id])
end

  def params_team
    params.require(:team).permit(:name).merge(room_id: params[:room_id])
  end
end
