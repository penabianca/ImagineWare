class User < ActiveRecord::Base

  has_many :submissions,inverse_of: :user, :dependent => :destroy
  has_one  :credit
  ActiveModel::ForbiddenAttributesProtection
  before_create :create_remember_token
  before_save { self.email = email.downcase }
  attr_accessible :email,:credit, :first_name, :last_name, :password, :password_confirmation, :remember_token, :instruc

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },uniqueness:{ case_sensitive: false }

  has_secure_password

  def self.instructors_requests
    User.where(:status => "pending")
  end
  def self.instructors
    User.where('instruc' => true)
  end
  def self.students
    User.where('instruc' => false, 'admin' => false, 'status' => "approved")
  end
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
