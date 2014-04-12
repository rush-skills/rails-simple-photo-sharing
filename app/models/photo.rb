class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :comments
  attr_accessible :name, :user_id,:image, :remote_image_url
  mount_uploader :image, ImageUploader
end
