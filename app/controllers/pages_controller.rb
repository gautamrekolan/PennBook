class PagesController < ApplicationController
  def home
    @title = "Home"
    @posts = Post.paginate(:page => params[:page])
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

end
