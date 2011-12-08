class LikesController < ApplicationController

  def create
    @interest = Interest.find(params[:like][:interest_id])
    current_user.like!(@interest)
    redirect_to @interest
  end

  def destroy
    @interest = Like.find(params[:id]).interest
    current_user.unlike!(@interest)
    redirect_to @interest
  end
end
