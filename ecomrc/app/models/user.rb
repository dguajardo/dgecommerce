class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  has_many :products, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :likes
  
  has_many :product_likes, through: :likes, source: :likeable,
  source_type: 'Product'
  has_many :review_likes, through: :likes, source: :likeable,
  source_type: 'Review'
  
  enum role: [:guest, :moderator]
  validates :name, :lastname, :username, presence:true 
  
  
end
