class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  #attr_accessible :email, :first_name, :last_name 
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: {minimum: 6}
  #validates :email, presence: true
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness:{ case_sensitive: false }
  #validates :email, presence: true, email_format: { message: "doesn't look like an email address" }, uniqueness:{ case_sensitive: false }

  has_secure_password
end
