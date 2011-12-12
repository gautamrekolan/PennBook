class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @user = current_user
      @title = @user.name
      @post = Post.new
      @posts = current_user.feed.paginate(:page => params[:page])
    end
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

  def visualize
    if signed_in?
      @user = current_user
      @title = @user.name
    end
  end
end
