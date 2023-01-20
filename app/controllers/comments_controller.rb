class CommentsController < ApplicationController
  before_action :set_room
  before_action :set_student
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to  room_student_path(id: params[:student_id])
    else
      @student = @comment.student
      @comments = @student.comments
      redirect_to  room_student_path(id: params[:student_id])
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, student_id: params[:student_id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end
  
    def set_student
      @student = Student.find(params[:student_id])
    end
  end