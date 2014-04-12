class Like < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user 
  attr_accessible :photo_id, :user_id
end
