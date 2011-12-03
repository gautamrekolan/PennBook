class PagesController < ApplicationController
  def home
    @title = "Home"
    @posts = Post.all
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

end
