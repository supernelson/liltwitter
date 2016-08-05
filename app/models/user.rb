require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
  								  foreign_key: "follower_id",
  								  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
  								   foreign_key: "followed_id",
  								   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :username, presence: true
  validates :password_hash, presence: true

  include BCrypt

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(entered_password)
  	self.password == entered_password
  end

end
