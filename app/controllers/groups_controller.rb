class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  
  def new
  end
  
end
