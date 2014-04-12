class LikesController < ApplicationController
  def create
  	photo = Photo.find(params[:id])
  	unless Like.find(:first, :conditions => [ "user_id = ? AND photo_id = ?", current_user.id, params[:id]])
	  	like = Like.new
	  	like.user_id = current_user.id
	  	like.photo_id = params[:id]
	  	redirect_to photo, notice: 'Succesfully liked.' 
	  	like.save!
	else
		redirect_to photo, notice: 'Already liked.'
 	end
  end

  def destroy
  end
end
