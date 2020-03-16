class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #following
  has_many :active_relationships, class_name:"Relationship", foreign_key:"follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  #followers
  has_many :passive_relationships, class_name:"Relationship", foreign_key:"followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  #authentication for user
  def self.authenticate(email, password)
  	user = User.find_for_authentication(email: email)
  	user.try(:valid_password?, password) ? user : nil
  end  

  #user follow
  def follow(other_user)
  	active_relationships.create(followed_id: other_user.id)
  end

  #user unfollow
  def unfollow(other_user)
  	active_relationships.find_by(followed_id: other_user.id).destroy
  end

  #if user follow other user then it will return true
  def following?(other_user)
  	following.include?(other_user)
  end
  
end
