class User < ApplicationRecord
  extend Enumerize
  include BCrypt

  has_many :posts
  has_many :comments
  has_many :platforms
  has_many :devises, dependent: :destroy

  validates :name, :login, :email, :password, :role, :age, presence: true
  validates :password, confirmation: true, uniqueness: true
  validates_numericality_of :age,  only_integer: true
  enumerize :role, in: [:admin, :guest], default: :guest

  validates_associated :posts, :comments, :platforms
  before_create :encrypting

  def encrypting
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(self.password, self.salt)
    end


  def password_encrypt?(password)
    self.password == BCrypt::Engine.hash_secret(password, self.salt)
  end

end

