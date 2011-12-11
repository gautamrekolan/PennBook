class InterestsController < ApplicationController
  def index
    @title = "Interests"
    @interests = Interest.paginate(:page => params[:page])
  end

  def show
    @interest = Interest.find(params[:id])
    @title = @interest.name
    @users = @interest.users
  end

  def new
    @title = "New Interest"
  end

end
