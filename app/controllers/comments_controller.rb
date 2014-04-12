class CommentsController < ApplicationController
  def create
  	photo = Photo.find(params[:id])
  	comment = Comment.new
  	comment.user_id = current_user.id
  	comment.photo_id = params[:id]
  	comment.content = params[:comment]
  	redirect_to photo, notice: 'Comment was successfully added.' 
  	comment.save!
  end

  def destroy
  end
end
