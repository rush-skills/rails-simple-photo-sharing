class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user 
  attr_accessible :content, :photo_id, :user_id
end
