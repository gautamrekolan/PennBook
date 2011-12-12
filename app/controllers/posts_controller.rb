class PostsController < ApplicationController  
  def index
    @posts = Post.where("user_id = ? and created_at > ?", params[:user_id], Time.at(params[:after].to_i + 1))
    @user = current_user
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @user, :notice => 'Post was successfully created.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { redirect_to @user, :notice => 'Post was unsuccessful.' }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to @user, :notice => 'Post was successfully deleted.' }
      format.json { head :ok }
    end
  end
end
