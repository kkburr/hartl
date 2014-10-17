class User < ActiveRecord::Base
	has_many :microposts
	before_save { email.downcase! }
	validates :name, presence: true, length: {maximum: 50}
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, 
					presence: true, 
					uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
end
