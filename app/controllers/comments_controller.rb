class CommentsController < ApplicationController
  def create
  	@topic = Topic.find(params[:topic_id])
  	@post = @topics.posts.find(params[:post_id])
  	comments = @post.comments

  	@comments = current_user.comments.build(params[:comment])
  	@comment.post = @post
  end
end