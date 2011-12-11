class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    @comment = @post.comments.create!(params[:comment])
    
    if @comment.save
      redirect_to @post.user, :notice => 'Your comment was posted successfully.'
    else
      redirect_to @post.user, :notice => 'Sorry, your comment was unsuccessful.'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @user = @post.user
    @comment.destroy
    redirect_to @post.user, :notice => 'Your comment was successfully deleted.'
  end
end