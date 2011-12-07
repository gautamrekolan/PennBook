class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @user = current_user
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

end
