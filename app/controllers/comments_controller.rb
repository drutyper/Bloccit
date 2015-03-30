class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	comments = @post.comments

  	@comment = current_user.comments.build(comments_params)
  	@comment.post = @post
  	authorize @comment

    if @comment.save
  		flash[:notice] = "Comment saved."
  		redirect_to [@post]
  	else
  	    flash[:error] = "There was an error saving the comment. Please try again."	
 	    redirect_to [@post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted, Try again." 
  end

  respond_to do |format|
    format.html
    format.js
  end
end

  def comments_params
  	params.require(:comment).permit(:body)
  end
end
