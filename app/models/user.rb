class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  validates :username, :password, :email, presence: :true

  def slug
  	self.username.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
  	name = slug.gsub("-", " ")
  	self.find_by(username: name)
  end
end
