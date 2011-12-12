class PostsController < ApplicationController  
  # POST /posts
  # POST /posts.json
  def create
    @user = User.find(params[:user_id])
    if params[:post][:poster_id]
      @post = @user.posts.build(params[:post])
    else
      @post = current_user.posts.build(params[:post])
    end

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
      format.html { redirect_to @user, :notice => 'Post was successfully deleted.' }
      format.json { head :ok }
    end
  end
end
