class Review < ActiveRecord::Base

	belongs_to :product
	belongs_to :user

	has_many :likes, as: :likable
	has_many :user_likes, through: :likes, source: :user
	
end
