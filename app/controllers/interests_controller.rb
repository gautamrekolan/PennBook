class InterestsController < ApplicationController
  def index
    @title
    @interests = Interest.paginate(:page => params[:page])
  end

  def show
    @interest = Interest.find(params[:id])
  end

  def new
    @title = "New Interest"
  end

end
