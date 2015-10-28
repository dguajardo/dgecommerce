class Product < ActiveRecord::Base
	
	has_many :reviews, dependent: :destroy
	
	has_many :likes, as: :likable
	has_many :user_likes, through: :likes, source: :user
	
	belongs_to :user
	belongs_to :category

	mount_uploader  :photo, PhotoUploader
end
