# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  #before_save :default_values

  validates :username, presence: true, length: { minimum: 4, maximum: 50 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  has_many :questions
  has_many :votes
  has_many :a_votes #remove
  has_many :answers

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_courses, through: :relationships, source: :followed

  def following?(course)
    relationships.find_by_followed_id(course.id)
  end

  def follow!(course)
    relationships.create!(followed_id: course.id)
  end

  def unfollow!(course)
    relationships.find_by_followed_id(course.id).destroy
  end


  private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64 #self used to ensure "User.rememeber_token" is assigned
	end

  def default_values
    self.admin = false
    #self.follow!(Course.first) //only in alpha mode
  end

end
