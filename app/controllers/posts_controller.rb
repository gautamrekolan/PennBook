class PostsController < ApplicationController
  # GET /posts/1/edit
  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
