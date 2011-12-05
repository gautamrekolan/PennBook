class InterestsController < ApplicationController

  def show
    @interest = Interest.find(params[:id])
  end

  def new
    @title = "New Interest"
  end

end
