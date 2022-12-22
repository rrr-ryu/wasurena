class StudentsController < ApplicationController
  before_action :set_room
  before_action :authenticate_user!

  def index
  end
  

  private
  def set_room
    @room = Room.find(params[:room_id])
  
end
