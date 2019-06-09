class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  has_many :articles, dependent: :destroy
  has_many :comments
  before_save { self.email = email.downcase }

  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  field :admin, type: Boolean, default: false

  validates :username, presence: true,
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
  
  # VALID_EMAIL_REGEX: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: { minimum: 3, maximum: 105 },
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
  
  has_secure_password
end
