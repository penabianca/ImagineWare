class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save { self.email = email.downcase }
  before_save :check_privilege
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_token

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: {minimum: 6}
  #validates :email, presence: true
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },uniqueness:{ case_sensitive: false }
  #validates :email, presence: true, email_format: { message: "doesn't look like an email address" }, uniqueness:{ case_sensitive: false }

  validates :group, presence: true, numericality: true

  has_secure_password

  def User.admin?
    self.group == 0
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def check_privilege
    self.privilege ||= 7
  end
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
