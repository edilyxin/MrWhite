class User < ActiveRecord::Base
	before_save { email.downcase! }
	before_create :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	has_secure_password
	
	has_many :stores
	has_many :scores

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def my_score
		total_score = 0
		self.scores.to_a.each { |s| total_score += s.score }
		total_score
	end

	private

	def create_remember_token
		self.remember_token = User.hash(User.new_remember_token)
	end

end
