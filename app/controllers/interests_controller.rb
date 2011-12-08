class InterestsController < ApplicationController
  def index
    @title
    @interests = Interest.paginate(:page => params[:page])
  end

  def show
    @interest = Interest.find(params[:id])
    @users = @interest.users
  end

  def new
    @title = "New Interest"
  end

end
