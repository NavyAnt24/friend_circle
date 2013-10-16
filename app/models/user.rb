class User < ActiveRecord::Base

  attr_accessible :email, :password_digest, :session_token
  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, :allow_nil => true }
  attr_reader :password

  has_many :f_circles

  before_validation :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)
    if @user.nil?
      return nil
    else
      @user.is_password?(password) ? @user : nil
    end
  end
end
